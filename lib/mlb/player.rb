module MLB
  class Player
    attr_accessor :name, :number, :position

    def initialize(attributes={})
      attributes.each_pair do |key, value|
        self.send("#{key}=", value) if self.respond_to?("#{key}=")
      end
    end

    protected

    # Returns an array of Player objects given a team roster
    def self.all_from_roster(players)
      players.map do |player|
        new(
          :name     => player['player'],
          :number   => player['number'],
          :position => player['position']
        )
      end
    end

  end
end