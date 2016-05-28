.class public Landroid/support/v7/internal/widget/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# static fields
.field private static sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 37
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v1, v2, :cond_2b

    .line 39
    :try_start_6
    const-class v1, Landroid/view/View;

    const-string v2, "computeFitSystemWindows"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/graphics/Rect;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Landroid/graphics/Rect;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Landroid/support/v7/internal/widget/ViewUtils;->sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;

    .line 41
    sget-object v1, Landroid/support/v7/internal/widget/ViewUtils;->sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 42
    sget-object v1, Landroid/support/v7/internal/widget/ViewUtils;->sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_2b} :catch_2c

    .line 48
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    :cond_2b
    :goto_2b
    return-void

    .line 44
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_2c
    move-exception v0

    .line 45
    .restart local v0    # "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "ViewUtils"

    const-string v2, "Could not find method computeFitSystemWindows. Oh well."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2b
.end method

.method public static combineMeasuredStates(II)I
    .registers 3
    .param p0, "curState"    # I
    .param p1, "newState"    # I

    .prologue
    .line 65
    or-int v0, p0, p1

    return v0
.end method

.method public static computeFitSystemWindows(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 7
    .param p0, "view"    # Landroid/view/View;
    .param p1, "inoutInsets"    # Landroid/graphics/Rect;
    .param p2, "outLocalInsets"    # Landroid/graphics/Rect;

    .prologue
    .line 73
    sget-object v1, Landroid/support/v7/internal/widget/ViewUtils;->sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_12

    .line 75
    :try_start_4
    sget-object v1, Landroid/support/v7/internal/widget/ViewUtils;->sComputeFitSystemWindowsMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_12} :catch_13

    .line 80
    :cond_12
    :goto_12
    return-void

    .line 76
    :catch_13
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ViewUtils"

    const-string v2, "Could not invoke computeFitSystemWindows"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_12
.end method

.method public static isLayoutRtl(Landroid/view/View;)Z
    .registers 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    const/4 v0, 0x1

    .line 53
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static makeOptionalFitsSystemWindows(Landroid/view/View;)V
    .registers 6
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 87
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_23

    .line 91
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "makeOptionalFitsSystemWindows"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 92
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v2

    if-nez v2, :cond_1d

    .line 93
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 95
    :cond_1d
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_23} :catch_24
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_6 .. :try_end_23} :catch_2d
    .catch Ljava/lang/IllegalAccessException; {:try_start_6 .. :try_end_23} :catch_36

    .line 104
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_23
    :goto_23
    return-void

    .line 96
    :catch_24
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v2, "ViewUtils"

    const-string v3, "Could not find method makeOptionalFitsSystemWindows. Oh well..."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_23

    .line 98
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_2d
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ViewUtils"

    const-string v3, "Could not invoke makeOptionalFitsSystemWindows"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23

    .line 100
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_36
    move-exception v0

    .line 101
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "ViewUtils"

    const-string v3, "Could not invoke makeOptionalFitsSystemWindows"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23
.end method
