require "pry"
def game_hash
  game_hash = {home: {
              team_name: "Brooklyn Nets",
              colors: ["Black", "White"],
              players: {
                "Alan Anderson" => {
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1},
                "Reggie Evans" => {
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7},
                "Brook Lopez" => {
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15},
                "Mason Plumlee" => {
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 12,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5},
                "Jason Terry" => {
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1}
              }
            },
          away: {
              team_name: "Charlotte Hornets",
              colors: ["Turquoise", "Purple"],
              players: {
                "Jeff Adrien" => {
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2},
                "Bismak Biyombo" => {
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 7,
                  blocks: 15,
                  slam_dunks: 10},
                "DeSagna Diop" => {
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5},
                "Ben Gordon" => {
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0},
                "Brendan Haywood" => {
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 22,
                  blocks: 5,
                  slam_dunks: 12}
              }
          }
  }
end

def num_points_scored(player)
  game_hash.each do |team, v|
    if game_hash[team][:players].include? player
      return game_hash[team][:players][player][:points]
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, v|
    if game_hash[team][:players].include? player
      return game_hash[team][:players][player][:shoe]
    end
  end
end


def team_colors(team_name)
  game_hash.each do |team, v|
    if game_hash[team][:team_name].include? team_name
      return game_hash[team][:colors]
    end
  end
end



def team_names
  game_hash.collect do |team, v|
    game_hash[team][:team_name]
  end
end



def player_numbers(team)
  if game_hash[:home][:team_name].include? team
    game_hash[:home][:players].collect do |team, v|
      v[:number]
    end
  else
    game_hash[:away][:players].collect do |team, v|
      v[:number]
    end
  end
end


def player_stats(player)
  if game_hash[:home][:players].include? player
    player_var = game_hash[:home][:players][player]
  else
    player_var = game_hash[:away][:players][player]
  end
end


def big_shoe_rebounds
  shoe_sizes = []
  game_hash.collect do |team, v|
    v[:players].collect do |stat, integer|
      shoe_sizes << integer[:shoe]
    end
  end
  shoe_sizes_sorted = shoe_sizes.sort.reverse
  game_hash.each do |team, v|
    game_hash[team][:players].each do |player, stat|
      if game_hash[team][:players][player][:shoe] == shoe_sizes_sorted[0]
        return game_hash[team][:players][player][:rebounds]
      end
    end
  end
end
