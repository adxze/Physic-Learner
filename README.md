# Physics Learner

<table>
  <tr>
    <td align="left" width="50%">
      <img width="100%" alt="gif1" src="https://github.com/yourusername/physicsplatformer/blob/main/demo1.gif">
    </td>
    <td align="right" width="50%">
      <img width="100%" alt="gif2" src="https://github.com/yourusername/physicsplatformer/blob/main/demo2.gif">
    </td>
  </tr>
</table>

---

## Scene Flow 

```mermaid
flowchart LR
  mm[Main Menu]
  gp[Gameplay]
  ls[Lesson Screen]
  es[End Screen]

  mm -- "Click Play" --> gp
  gp -- "Physics Challenge" --> ls
  gp -- "Game Over" --> es
  ls -- "Resume" --> gp
  es -- "Restart" --> gp
  es -- "Main Menu" --> mm
```

---

## Layer / Module Design 

```mermaid
---
config:
  theme: neutral
  look: neo
---
graph TD
    subgraph "Game Initialization"
        Start([Game Start])
        Boot[Boot Layer]
        SaveCheck{Save Data<br/>Exists?}
    end
    subgraph "Main Menu System"
        MM[Main Menu]
        Settings[Settings Menu]
    end
    subgraph "Gameplay Flow"
        GP[Gameplay Scene]
        PhysicsPuzzle[Physics Question System]
        Lessons[Lesson Popups]
        Pause[Pause Menu]
    end
    subgraph "Level Progression"
        Level1[Momentum Challenge]
        Level2[Force & Motion]
        Level3[Energy & Collisions]
        MoreLevels[More Lessons...]
    end
    subgraph "End States"
        GameOver[Game Over]
        LessonComplete[Lesson Complete]
        ES[End Screen]
    end

    Start --> Boot
    Boot --> SaveCheck
    SaveCheck -->|No Save| MM
    SaveCheck -->|Has Save| GP
    MM -->|Play| GP
    MM -->|Settings| Settings
    Settings --> MM

    GP --> PhysicsPuzzle
    GP --> Pause
    PhysicsPuzzle --> Lessons
    Lessons --> GP

    GP --> Level1
    Level1 -->|Complete| Level2
    Level2 -->|Complete| Level3
    Level3 -->|Complete| MoreLevels

    GP -->|Failure| GameOver
    GP -->|Success| LessonComplete
    LessonComplete --> GP
    GameOver --> ES
    ES -->|Restart| GP
    ES -->|Main Menu| MM

    classDef initStyle fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef menuStyle fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef gameplayStyle fill:#e8f5e8,stroke:#1b5e20,stroke-width:2px
    classDef levelStyle fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef endStyle fill:#ffebee,stroke:#b71c1c,stroke-width:2px

    class Start,Boot,SaveCheck initStyle
    class MM,Settings menuStyle
    class GP,PhysicsPuzzle,Lessons,Pause gameplayStyle
    class Level1,Level2,Level3,MoreLevels levelStyle
    class GameOver,LessonComplete,ES endStyle
```

---

## Modules and Features

| 📂 Name | 🎬 Scene | 📋 Responsibility |
|---------|----------|-------------------|
| **MainMenu** | **Main Menu** | - Show menu UI<br/>- Start new game or load save<br/>- Exit game |
| **Settings** | **Main Menu**<br/>**Gameplay** | - Adjust audio, difficulty, and accessibility options |
| **GameManager** | **Gameplay** | - Handle progression between lessons<br/>- Track score & learning milestones |
| **PlayerController** | **Gameplay** | - Control robot movement and jumps<br/>- Interact with physics-based objects<br/>- Apply learned mechanics |
| **PhysicsPuzzle** | **Gameplay** | - Spawn questions integrated into environment<br/>- Pause gameplay until solved<br/>- Unlock gates or items on success |
| **LessonSystem** | **Gameplay** | - Provide short explanations of physics concepts<br/>- Display diagrams or hints |
| **EnemyController** | **Gameplay** | - Spawn moving obstacles<br/>- React to player physics (momentum, collisions) |
| **Ladder/PlatformSystem** | **Gameplay** | - Enable climbing, ladders, moving platforms<br/>- Teach applied forces |
| **HealthSystem** | **Gameplay** | - Manage player life<br/>- Reset on hazard collision |
| **GameOver** | **Gameplay** | - Display failure screen<br/>- Allow retry or exit |

---

## Game Flow Chart

```mermaid
---
config:
  theme: redux
  look: neo
---
flowchart TD
  start([Begin Lesson])
  start --> play{Player explores level}
  play --> obj{Reach obstacle}
  obj --> puzzle{Physics Question triggered}
  puzzle --> correct{Answered Correctly?}
  correct -->|Yes| unlock[Unlock passage]
  correct -->|No| retry[Retry Question]
  retry --> puzzle
  unlock --> cont[Continue Level]
  cont --> endCheck{Level end reached?}
  endCheck -->|Yes| lessonComplete[Lesson Complete]
  endCheck -->|No| play
  lessonComplete --> next[Next Level]
  next --> start
  play --> hazard{Hit hazard?}
  hazard -->|Yes| gameOver[Game Over]
  hazard -->|No| play
```

---

## Event Signal Diagram

```mermaid
classDiagram
    class PlayerController {
        +OnMove()
        +OnJump()
        +OnClimb()
        +OnInteract(object: string)
    }

    class PhysicsPuzzle {
        +OnQuestionTriggered(questionID: int)
        +OnAnswerSubmitted(answer: string)
        +OnPuzzleSolved()
    }

    class LessonSystem {
        +OnLessonStart(topic: string)
        +OnLessonEnd(topic: string)
    }

    class GameManager {
        +OnLevelStart(level: string)
        +OnLessonComplete(level: string)
        +OnGameOver()
    }

    class EnemyController {
        +OnSpawn()
        +OnCollision(player: PlayerController)
    }

    PlayerController --> PhysicsPuzzle : interacts
    PhysicsPuzzle --> LessonSystem : triggers
    GameManager --> PhysicsPuzzle : manages
    GameManager --> LessonSystem : tracks
    EnemyController --> PlayerController : collides
```

---

## Developer & Contributions

- Adiguna S Ligawan (Game Developer & Designer)  
  <br>

---

## About

**Physics Platformer** combines fun platforming action with interactive physics education. As players guide a friendly robot through bright pixel-art levels, they encounter obstacles that can only be solved by answering real-world physics questions. Each challenge integrates lessons about momentum, force, and motion directly into gameplay.

---

## Key Features

**Physics-Based Gameplay**: Movement and challenges directly reflect physics principles like momentum, gravity, and force.  

**Interactive Lessons**: Embedded lessons appear at obstacles, reinforcing learning through action.  

**Robot Character**: A friendly companion makes the game accessible to all ages.  

**Progressive Difficulty**: Lessons scale with deeper levels, teaching increasingly complex concepts.  

**Pixel Art Style**: Bright visuals ensure a fun and engaging learning experience.  

---

## Play The Game

<a href="#">Play Now</a>  
<br>

![Physics Platformer Demo](https://github.com/yourusername/physicsplatformer/blob/main/demo_preview.png)


![Platform Demo](https://github.com/adxze/adxze/blob/main/PhysicSlide.png)

⚠️ COMPATIBILITY WARNING
Please be advised that this game was developed using Godot Engine version 4.0, which is may be considered a legacy version.
