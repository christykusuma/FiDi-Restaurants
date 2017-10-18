
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
}])

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
	review: "It's okay, very salty!",
	has_been: true
}])

