# HabitTracker

Rainmeter Monthly Habit Tracker Widget

A minimal Rainmeter skin that lets you track your daily progress for the current month. Each day is shown as a small square on your desktop, and you can click the square to mark the day as completed. This is meant to be a simple visual habit tracker that stays in front of you whenever you're using your PC.

How It Works

The skin automatically detects the current month and shows the correct number of days (28–31).

Each day appears as a semi-transparent white box arranged in a clean grid.

When you click a box, it turns green and shows the date number inside it.

Clicking it again turns it back to white.

All changes are saved, so your progress stays even after restarting Rainmeter or Windows.

File Structure

This project uses three small files:

1. .ini File (Main Skin)

Handles layout

Creates all day boxes

Applies colors and styles

Connects each box to the Lua script

2. .lua File (Toggle Logic)

Checks which box was clicked

Switches its state between completed and not completed

Updates the box color

Writes the new state to the .inc file

3. .inc File (Saved Data)

Stores the current month’s progress as a string of 0 and 1

Example: 101011000... (31 characters for 31 days)

Gets updated automatically whenever you click a box

Purpose

The idea behind this skin is to make progress visible. When you see the green boxes filling up the month, you feel more motivated to continue your streak. It’s simple, lightweight, and stays out of the way while still keeping you aware of your daily goals.

Features

Clean minimal grid

Click-to-toggle habit tracking

Auto-save progress

Auto-adjusts to month length

Lightweight and beginner friendly
