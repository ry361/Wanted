NMConfig = {}

NMConfig['General'] = {
    buyType = 'cash', -- cash or bank
    buyAmount = 20,
}

NMConfig['Target'] = {
    targetOptions = true,
    targetCoords = {coords = vector3(448.3229, -974.5187, 30.49216)},
    targetType = 'qbcore', -- For this feature, there are two options: "ox" and "qbcore"
    targetIcon = {editor = 'fas fa-clipboard', preview = 'fas fa-search'}, -- You can replace this with a new icon (https://fontawesome.com/)
    targetLabels = {editor = 'Wanted Editor', preview = 'Wanted Preview', buy = 'Buy Wanted Paper'},
    jobName = 'police',
}