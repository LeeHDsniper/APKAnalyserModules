.class public abstract Landroid/support/v7/app/ActionBar;
.super Ljava/lang/Object;
.source "ActionBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBar$LayoutParams;,
        Landroid/support/v7/app/ActionBar$Tab;,
        Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1318
    return-void
.end method


# virtual methods
.method public collapseActionView()Z
    .registers 2

    .prologue
    .line 1069
    const/4 v0, 0x0

    return v0
.end method

.method public dispatchMenuVisibilityChanged(Z)V
    .registers 2
    .param p1, "visible"    # Z

    .prologue
    .line 1040
    return-void
.end method

.method public abstract getDisplayOptions()I
.end method

.method public abstract getHeight()I
.end method

.method public getHideOffset()I
    .registers 2

    .prologue
    .line 980
    const/4 v0, 0x0

    return v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 847
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract hide()V
.end method

.method public invalidateOptionsMenu()Z
    .registers 2

    .prologue
    .line 1054
    const/4 v0, 0x0

    return v0
.end method

.method public abstract isShowing()Z
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2
    .param p1, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 1036
    return-void
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "ev"    # Landroid/view/KeyEvent;

    .prologue
    .line 1064
    const/4 v0, 0x0

    return v0
.end method

.method public setDefaultDisplayHomeAsUpEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1028
    return-void
.end method

.method public abstract setDisplayHomeAsUpEnabled(Z)V
.end method

.method public abstract setDisplayOptions(I)V
.end method

.method public abstract setDisplayShowHomeEnabled(Z)V
.end method

.method public setElevation(F)V
    .registers 4
    .param p1, "elevation"    # F

    .prologue
    .line 1008
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_d

    .line 1009
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting a non-zero elevation is not supported in this action bar configuration."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1012
    :cond_d
    return-void
.end method

.method public setHideOnContentScrollEnabled(Z)V
    .registers 4
    .param p1, "hideOnContentScroll"    # Z

    .prologue
    .line 953
    if-eqz p1, :cond_a

    .line 954
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Hide on content scroll is not supported in this action bar configuration."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 957
    :cond_a
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 835
    return-void
.end method

.method public setShowHideAnimationEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1032
    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 1074
    return-void
.end method

.method public abstract show()V
.end method

.method public startActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    .line 1044
    const/4 v0, 0x0

    return-object v0
.end method
