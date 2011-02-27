module Inploy
  module Servers
    module Passenger
      def restart_server
        run "mkdir -p tmp && touch tmp/restart.txt"
      end
    end
  end
end