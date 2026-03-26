; ============================================
; 多区域轻量版 - 使用快速检测
; ============================================

#Requires AutoHotkey v1.1+
#SingleInstance Force
CoordMode, Mouse, Screen

EdgeThreshold := 5

~!WheelUp::
    if (IsOnTriggerArea()) {
        Send ^#{Left}
    }
    return

~!WheelDown::
    if (IsOnTriggerArea()) {
        Send ^#{Right}
    }
    return

IsOnTriggerArea() {
    MouseGetPos, x, y, , class
    
    ; 使用局部变量，减少重复调用
    return (y <= EdgeThreshold 
        or x <= EdgeThreshold 
        or x >= A_ScreenWidth - EdgeThreshold 
        or class = "Shell_TrayWnd")
}
