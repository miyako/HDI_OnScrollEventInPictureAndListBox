![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_OnScrollEventInPictureAndListBox

Tracking and driving the scroll position of a scrollable picture input and a list box through the scroll form event. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v15**; restored so it runs on current 4D releases.

## What it demonstrates

- Reading the live scroll offset of a list box and of a picture input with `OBJECT GET SCROLL POSITION` from their scroll event.
- Programmatically scrolling those objects from external controls (sliders/rulers) with `OBJECT SET SCROLL POSITION`.
- Building a thumbnail viewport indicator: a rectangle is repositioned over a scaled preview to reflect where the picture is scrolled.
- Querying scroll-bar geometry with `LISTBOX Get property` (`lk hor scrollbar height`, `lk ver scrollbar width`) to compute the visible area.
- Filling a list box at runtime with `LISTBOX INSERT COLUMN` and pointer-based arrays.

## Key commands

| Command | Used for |
|---|---|
| `OBJECT GET SCROLL POSITION` | Read the current scroll offset of the picture and list box |
| `OBJECT SET SCROLL POSITION` | Scroll the list box from the ruler controls |
| `OBJECT GET COORDINATES` / `OBJECT SET COORDINATES` | Measure the picture and move the viewport rectangle |
| `LISTBOX Get property` | Read scroll-bar height/width to compute the visible region |
| `LISTBOX INSERT COLUMN` | Populate the list box with 20 columns at load |
| `READ PICTURE FILE` | Load the sample picture into `vPicture` |

## How it works

`Demo_Start` opens `HDI2` as a dialog. The form method (`Project/Sources/Forms/HDI2/method.4dm`) runs on `On Load`: it builds a 20-column, 200-row list box with `LISTBOX INSERT COLUMN` and pointer arrays, and reads `Picture.png` from the resources folder into `vPicture`.

The list box page wires the `List Box` object method to `On Scroll`, storing the offset in `SetListBoxPosV`/`SetListBoxPosH`; the `Ruler2`/`Ruler3` slider methods push those values back with `OBJECT SET SCROLL POSITION`, so the sliders and the list box stay in sync.

The picture page is the more interesting piece. The scrollable picture input `Variable` fires `On Scroll`, reads its position, and calls `MoveSelection` (`Project/Sources/Methods/MoveSelection.4dm`). That method subtracts the scroll-bar thickness (via `LISTBOX Get property`) from the object's coordinates to get the visible image size, then repositions `Rectangle1` over the small preview `Picture2` -- a moving viewport marker that mirrors the scroll position.

## Points of interest

- The scroll form event appears in source as `On Scroll:K2:57`; cite it as **On Scroll** in current 4D.
- `MoveSelection` reuses `LISTBOX Get property` purely to obtain scroll-bar thickness, so the viewport rectangle stays accurate regardless of platform scroll-bar sizing.
- Both the sliders and the object itself write scroll position, showing scroll can be observed and commanded through the same pair of commands.

## References

- [4D documentation: OBJECT GET SCROLL POSITION](https://developer.4d.com/docs/commands/object-get-scroll-position)
- [4D documentation: OBJECT SET SCROLL POSITION](https://developer.4d.com/docs/commands/object-set-scroll-position)
- [4D documentation: LISTBOX INSERT COLUMN](https://developer.4d.com/docs/commands/listbox-insert-column)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/48afcf4c-9d5b-4ae1-826e-c4488d0ce6fc" />

<img width="500" height="auto" alt="" src="https://github.com/user-attachments/assets/aeef0662-d186-4735-bb08-eaa6071a2881" />
