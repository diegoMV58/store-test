namespace :product do
  desc "This command is for populate database products from apis"
  task populate: :environment do
    PopulateProductsService.call
  end
end
