print("i'm executed as soon as vim opens")

-- do your projectspecific configs here
vim.opt.nu = true
vim.opt.relativenumber = true

-- optional return a function, that is run via vim.shedule
return function()
	print("i'm run via vim.schedule, as soon as vim is done doing other stuff")
end
