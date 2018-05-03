fsm = {}

local testmsg = ""

fsm.states = {
    ['idle'] = function(dt)
        testmsg = "you are in an idle state. press space to enter an action state."
        if love.keyboard.isDown("space") then 
            fsm.cur_state = 'action'
        end
    end,

    ['action'] = function(dt)
        testmsg = "you are in an action state. press return to enter an idle state."
        if love.keyboard.isDown("return") then 
            fsm.cur_state = 'idle'
        end
    end
}

fsm.cur_state = 'idle'

function fsm:update(dt)
    self.states[self.cur_state](dt)
    print(self.cur_state, testmsg)
end

return fsm