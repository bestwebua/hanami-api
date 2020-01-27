RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # An alternate to DatabaseCleaner:
  #
  # db = Sequel::Model.db     
  # config.around(:each) do |example|
  #   db.transaction(rollback: :always, auto_savepoint: true) do
  #     example.run
  #   end
  # end
end
