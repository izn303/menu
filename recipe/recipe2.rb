def search(menus)
  puts "検索する材料をひらがな入力してください"
  keyword = gets.chomp
  puts "-------------------------------"
  puts "検索材料:#{keyword}"

  result_array = menus.select { |menu| menu[:title].include?(keyword) || menu[:ingredients].include?(keyword) }
  if !result_array.empty?
    show_results(result_array)
  else
    puts "指定のキーワードでは見つかりませんでした\n\n"
  end
end



def feeling(menus)
  puts "いまの気分はこれ！\n\n"
  results = menus.sample
    puts "     ▼ ▼ ▼     \n\n"

  results.each do |result|
    puts result[1]
  end 
  puts "\n\n"
end



def show_results(results)
  puts "\n#{results.count}件見つかりました"
  results.each do |result|
    puts "-------------------------------"
    puts "メニュー: #{result[:title]}"
    puts "材料: #{result[:ingredients]}"
  end
  puts "-------------------------------\n\n"
end



# 外部ファイルからメニュー詳細を引き出す
require "yaml"
menus = YAML.load_file("menus.yaml")
menus.each do |menu|
 menu.transform_keys!(&:to_sym)
end

bar = "-------------------------------"



while true do
  puts bar
  puts "\nあなたの「何作って食べよう……」を解決！！"
  puts "メニューを選択してください。\n\n"
  puts "0:材料からメニュー検索"
  puts "1:気分でメニュー検索"
  puts "2:登録一覧を表示"
  puts "3:終了します。\n\n"
  puts bar

  case gets.to_i
  when 0
    puts "0:材料からメニュー検索"
    search(menus)
  when 1
    puts "1:気分でメニュー検索"
    feeling(menus)
  when 2
    puts "2:登録一覧を表示"
    puts menus
  when 3
    puts "3:終了します。"
    exit

  else
    puts"無効な入力です。"
    puts bar
  end
end