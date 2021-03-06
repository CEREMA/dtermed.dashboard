/*
 *
 *    Factures
 *    v1.00 
 *
 */

Factures = {
    export: function(o,cb)
    {
        var db=Factures.using('db');
        var excelbuilder=Factures.using('msexcel-builder');
        
        var temp=Factures.temp('xlsx');
        console.log(temp.filename);
        var workbook = excelbuilder.createWorkbook(temp.directory,temp.filename);
        var sheet1 = workbook.createSheet('Dashboard', 1500, 1500);
        var conf={};
        var sql=db.sql('export');
        sql+=" WHERE factures.id in ("+o.join(',')+")";
        db.model("dashboard",sql,function(e,tabs) {
            console.log(tabs);
            conf.cols=[];
            if (tabs.data.length==0) {
                cb("-1");
                return;  
            };
            for (var i=0;i<tabs.metaData.fields.length;i++) {
                conf.cols.push({
                    caption: tabs.metaData.fields[i].name,
                    type: "string",
                    width: 50
                }); 
            };
            console.log(conf.cols);
            for (var e=0;e<conf.cols.length;e++) {
                sheet1.set(e+1,1,conf.cols[e].caption);
                sheet1.width(e+1, conf.cols[e].width*1);
            };
            for (var i=0;i<tabs.data.length;i++) {
                var element=tabs.data[i];
                var k=1;
                var ii=i+2;
                for (var el in element) {
                    if (k<conf.cols.length) {
                        if (element[el] instanceof Date) {
                            element[el]=element[el].toString('dd/MM/yyyy');
                        };
                        sheet1.set(k, ii, element[el]);
                    };
                    k++;
                };
            };
            workbook.save(function(ok){
                cb(temp.url);
            });

        });        
    },
	get: function(o,cb) {
		var db=Factures.using('db');		
		console.log(db.sql('factures_get',{ID: o.id,YEAR: o.year}));
		db.model('dashboard',db.sql('factures_get',{ID: o.id,YEAR: o.year}),cb);
	},
	duplicateme: function(tab,ndx,cb) {
		var db=Factures.using('db');
		if (ndx<tab.length) {
			tab[ndx].prestation=tab[ndx].prestation;
			db.post('dashboard','factures',tab[ndx],function(err,response) {
				Factures.duplicateme(tab,ndx+1,cb);
			});
		} else cb();
	},
	duplicate: function(o,cb) {
		//console.log('duplicate');
		var db=Factures.using('db');
		//console.log(o);
		db.query('dashboard','select * from factures where id="'+o.ID+'"',function(err,result) {
			//console.log(err);
			//console.log(result);
			if (result.length>0) {
				var r=result[0];
				r._BLOB=[];
				delete r.id;
				//r.engagement='';
				r.immoNET='';
				r.BES=0;
				r.date_servicefait='NULL';
				r.nofacture='NULL';
				r.montant_facture='NULL';
				r.ej='';
				r.date_facture='NULL';
				var tab=[];
				for (var i=0;i<o.n;i++) tab.push(r);
				Factures.duplicateme(tab,0,cb);
			}
		});
	},
	upload_blob: function(list,ndx,cb)
	{
		if (!list[ndx]) {cb();return;}
		Factures.using('db').query('dashboard','select docId from docs where docId="'+list[ndx].docId+'"',function(err,result) {
			if (result.length>0) {
				// déjà uploadé
				Factures.upload_blob(list,ndx+1,cb);
			} else {
				Factures.using('db').query('dashboard','insert into docs VALUES ("'+list[ndx].docId+'","-1","-1","-1","-1")',function() {
                    App.upload.toBase64(list[ndx].docId,function(err,blob) {
                        Factures.using('db').post('dashboard','docs',{
                            docId: list[ndx].docId,
                            _blob: blob,
                            filename: list[ndx].filename,
                            type: list[ndx].filetype,
                            size: list[ndx].filesize
                        },function() {
                            Factures.upload_blob(list,ndx+1,cb);
                        });                        
                    });
				});			
			}
		});
	},
	insert: function(o,cb) {
		Factures.using('db').post('dashboard','factures',o,function(r){
			if (o._BLOB) {
				Factures.upload_blob(o._BLOB,0,function() {
					cb(r);
				});
			} else cb(r);
		});		
	},
	del: function(o,cb) {
		Factures.using('db').del('dashboard','factures',o,cb);
	},
	update: function(o,cb) {
		Factures.using('db').post('dashboard','factures',o,function(r,x){
			//console.log(o);
			if (o._BLOB) {
				Factures.upload_blob(o._BLOB,0,function() {
					cb(r);
				});
			} else cb(r);
		});	
	},
	//********************************************************************
	//								RAJOUT
	//********************************************************************
	setBES: function(o,cb) {
		var db=Factures.using('db');
		//console.log(o);	
		//db.query('infocentre2015',sql ,cb);		
		db.query('dashboard',db.sql('factures_setBES',{ID: o.id, BES: o.bes}),cb);
	}
	//********************************************************************
	//********************************************************************
};

module.exports = Factures;