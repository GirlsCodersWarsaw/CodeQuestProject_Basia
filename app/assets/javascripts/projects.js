$(document).ready(function() {
	var checkbox = document.getElementById('project_billable');
	var details_div = document.getElementById('financial-details');
	checkbox.onchange = function() {
		if(this.checked) {
			details_div.style['display'] = 'block'
		} else {
			details_div.style['display'] = 'none'
		}
	}
}
);