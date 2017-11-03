User.create([
{
	id: 1, 
	first: 'Christy', 
	last: 'Kusuma', 
	username: 'ckusuma', 
	password: '1'
}, {
	id: 2, 
	first: 'Vikki', 
	last: 'Braxton', 
	username: 'vbraxton', 
	password: '2'
}, {
	id: 3, 
	first: 'John', 
	last: 'Doe', 
	username: 'jdoe', 
	password: '1'
}
])

Restaurant.create([
{
	id: 1, 
	name: 'Open Kitchen', 
	order: 'Salmon, salad, chicken, fried rice'
}, {
	id: 2, 
	name: 'Grk', 
	order: 'Portobello griller, frozen yogurt'
}, {
	id: 3, 
	name: 'Bent On', 
	order: 'Bento box, ramen'
}, {
	id: 4, 
	name: 'Dig Inn', 
	order: 'Sweet potatoes, salad, herb chicken, tofu'
}, {
	id: 5, 
	name: 'Hale and Hearty', 
	order: 'Salad, soup'
}, {
	id: 6, 
	name: 'Melt Shop', 
	order: 'Grilled cheese sandwhich'
}, {
	id: 7, 
	name: 'Thai Sliders', 
	order: 'Pork sliders, pad si-eew, panang curry'
}, {
	id: 8, 
	name: 'Dos Toros Taqueria', 
	order: 'Tacos, burritos, grilled corn'
}, {
	id: 9, 
	name: 'Chipotle', 
	order: 'Mixed greens salad with beans, sour cream and grilled chicken'
}, {
	id: 10, 
	name: 'Bocadillo', 
	order: 'Bacon wrapped dates, tortilla española'
}])

Rating.create([
{
	id: 1, 
	user_id: 1, 
	restaurant_id: 1, 
	rating: 5,
	review: "Lots of great options!",
	has_been: true
}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 2, 
	rating: 4,
	review: "Really filling.",
	has_been: true
}, {
	id: 3, 
	user_id: 1, 
	restaurant_id: 3, 
	rating: 3,
	review: "It's cute.",
	has_been: true
}, {
	id: 4, 
	user_id: 1, 
	restaurant_id: 4, 
	rating: 3,
	review: "Long lines, but very good!",
	has_been: true
}, {
	id: 5, 
	user_id: 2, 
	restaurant_id: 5, 
	rating: 1,
	review: "It's okay, food is very salty!",
	has_been: true
}, {
	id: 6, 
	user_id: 1, 
	restaurant_id: 6, 
	rating: 5,
	review: "This place really hits the spot!",
	has_been: true
}, {
	id: 7, 
	user_id: 3, 
	restaurant_id: 7, 
	rating: 3,
	review: "Best pork sliders I've ever eaten",
	has_been: true
}, {
	id: 8, 
	user_id: 1, 
	restaurant_id: 8, 
	rating: 3,
	review: "Better version of Chipotle, very good quality!",
	has_been: true
}, {
	id: 9, 
	user_id: 3, 
	restaurant_id: 9, 
	rating: 2,
	review: "It's okay.",
	has_been: true
}, {
	id: 10, 
	user_id: 1, 
	restaurant_id: 10, 
	rating: 5,
	review: "Love this place! Serves breakfast food too!",
	has_been: true
}])

