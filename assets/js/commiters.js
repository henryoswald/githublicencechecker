$(document).ready(function () {



	if($('.typeahead')[0]) {

					var commiters = new Bloodhound({
							datumTokenizer: Bloodhound.tokenizers.obj.whitespace(["email", "name"]),
							queryTokenizer: Bloodhound.tokenizers.whitespace,
							identify: function(obj) {
								return obj.name;
							},
							prefetch: {
								url:"/"+window.location.href.split("/").slice(3,6).join("/")+"?exclude_self=true",
								cache:false
							}
					});

					$('.typeahead').typeahead({
							hint: true,
							highlight: true,
							minLength: 1
					},
					{
							name: 'commiters',
							source: commiters,
							// displayKey: 'email'
							display: function( data ) {
							    return data.name + " - " + data.email ;
							}
					}).on('typeahead:selected', function (e, suggestion) {
							$('#commiter_parent_commiter_id').val(suggestion.id);
					});
			}


})
