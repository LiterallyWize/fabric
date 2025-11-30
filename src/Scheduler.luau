--!strict

local Signal = require("./Signal")

type Signal<T...> = Signal.Signal<T...>
type Connection<T...> = Signal.Connection<T...>

local Scheduler = {}

local onRender = Signal.new() :: Signal<number>

function Scheduler.step(deltaTime: number): ()
	onRender:fire(deltaTime)
end

function Scheduler.connect(callback: (deltaTime: number) -> ()): Connection<number>
	return onRender:connect(callback)
end

return Scheduler
