# db/seeds.rb

# Seed categories
categories = Category.create([
  { name: 'Category 1' },
  { name: 'Category 2' },
  { name: 'Category 3' }
])

# Seed users
user1 = User.create({name: 'John Doe', email: 'john@example.com', encrypted_password: 'password' })

# Seed items
items = Item.create([
  { name: 'Item 1', amount: 10.0, author: users.first },
  { name: 'Item 2', amount: 20.0, author: users.second }
])

# Seed item_categories
item_categories = ItemCategory.create([
  { item: items.first.id, category: categories.first.id },
  { item: items.first.id, category: categories.second.id },
  { item: items.second.id, category: categories.first.id } # Assign a valid category_id
])