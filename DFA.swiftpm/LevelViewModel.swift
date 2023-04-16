import Foundation

class LevelViewModel : ObservableObject {
    @Published var allLevels: [LevelModel] =
    [
        LevelModel(
            levelNum: 1,
            level: "level1_",
            answer: ["👽", "?", "?", "?", "?", "?"],
            answer2: ["👽", "?", "?", "?", "?", "?"],
            pickerXPos: [0.5],
            pickerYPos: [0.05],
            xPos: [0.82, 0.82, 0.6, 0.2, -3],
            yPos: [0.9, 0.9, 0.6, 0.2, -3],
            angles: [65, -50, -65, -70, -75],
            objective: "Gather as many 👽 as you need.",
            finishX: 0.5,
            finishY: 0.68,
            finishAngle: -15),
            
        LevelModel(levelNum: 2,
                   level: "level2_",
                   answer: ["🌒", "👽", "🌒", "👽", "?", "?"],
                   answer2: ["🌒", "👽", "🌒", "👽", "?", "?"],
                   pickerXPos: [0.5, 0.93, 0.5, 0.06],
                   pickerYPos: [0.05, 0.5, 0.96, 0.5],
                   xPos: [0.67, 0.67, 0.4, 0.1, -3],
                   yPos: [0.75, 0.75, 0.4, 0.1, -3],
                   angles: [65, -50, -65, -70, -75],
                   objective: "Gather an odd number of 👽.",
                   finishX: 0.34,
                   finishY: 0.24,
                   finishAngle: -67),
        
        LevelModel(levelNum: 3,
                   level: "level2_",
                   answer: ["🌒", "👽", "🌒", "👽", "?", "?"],
                   answer2: ["🌒", "👽", "🌒", "👽", "?", "?"],
                   pickerXPos: [0.5, 0.93, 0.5, 0.06],
                   pickerYPos: [0.05, 0.5, 0.96, 0.5],
                   xPos: [0.67, 0.67, 0.4, 0.1, -3],
                   yPos: [0.75, 0.75, 0.4, 0.1, -3],
                   angles: [65, -50, -65, -70, -75],
                   objective: "Gather an even number of 👽.",
                   finishX: 0.5,
                   finishY: 0.6,
                   finishAngle: -18),
        
        LevelModel(levelNum: 4,
                   level: "level4_",
                   answer: ["👽", "👽", "👽", "🌒", "🌒", "🌒"],
                   answer2: ["🌒", "👽", "👽", "🌒", "🌒", "👽"],
                   pickerXPos: [0.5, 0.91, 0.88, 0.48, 0.1, 0.1],
                   pickerYPos: [0.05, 0.37, 0.67, 0.96, 0.63, 0.32],
                   xPos: [0.66, 0.66, 0.4, 0.1, -3],
                   yPos: [0.82, 0.82, 0.5, 0.2, -3],
                   angles: [70, -50, -65, -70, -75],
                   objective: "Gather 👽👽 consecutively at least once.",
                   finishX: 0.53,
                   finishY: 0.32,
                   finishAngle: 140)]
}
