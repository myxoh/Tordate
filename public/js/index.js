document.addEventListener('click', function(e) {

		switch(e.target.id){

			case "default":
				document.getElementById("default").className+= " activeItem";
				document.getElementById("best").className= "btn";
				document.getElementById("trending").className= "btn";
				document.getElementById("newest").className= "btn";
			break;

			case "best":
				document.getElementById("default").className= "btn";
				document.getElementById("best").className+= " activeItem";
				document.getElementById("trending").className= "btn";
				document.getElementById("newest").className= "btn";
			break;

			case "trending":
				document.getElementById("default").className= "btn";
				document.getElementById("best").className= "btn";
				document.getElementById("trending").className+= " activeItem";
				document.getElementById("newest").className= "btn";
			break;

			case "newest":
				document.getElementById("default").className= "btn";
				document.getElementById("best").className= "btn";
				document.getElementById("trending").className= "btn";
				document.getElementById("newest").className+= " activeItem";
			break;						

		}
});