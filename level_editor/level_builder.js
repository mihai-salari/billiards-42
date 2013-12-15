
var levelBuilder = {

	defaults: {
		ball: {
			img: 'img/ball.png',
			radius: 32
		},
		pocket: {
			img:'img/pocket.png',
			radius: 35
		}
	},
	
	result: {
	},

	createWorld: function(background,width,height) {
		this.result = {};
		this.result.id = 1; // stub
		this.result.models = [];
		this.result.models.push( this.buildModel('World', {mid:1, size: {width:width,height:height}, background:background } ) );
		this.logResult();
	},
	
	buildModel: function(klass, props) {
		var res = {'class':klass};
		for( var attrname in props ) {
			res[attrname] = props[attrname];
		}
		return res;
	},
	
	placeBall: function( cx, cy ) {
		this.result.models.push( this.buildModel('Ball', { position: {x:cx,y:cy}, radius: this.defaults.ball.radius } ) );
		this.logResult();
	},
	
	placePocket: function( cx, cy ) {
		this.result.models.push( this.buildModel('Pocket', { center: {x:cx,y:cy}, radius: this.defaults.pocket.radius } ) );
		this.logResult();
	},
	
	placeWall: function( start, end ) {
		this.result.models.push( this.buildModel('Wall', { start : start, end : end } ) );
		this.logResult();
	},
	
	logResult: function() {
		console.log( this.result );
	}
	
	
}