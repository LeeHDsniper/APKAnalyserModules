.class Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;
.super Landroid/support/v7/internal/view/WindowCallbackWrapper;
.source "AppCompatDelegateImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AppCompatDelegateImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AppCompatWindowCallbackBase"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;


# direct methods
.method constructor <init>(Landroid/support/v7/app/AppCompatDelegateImplBase;Landroid/view/Window$Callback;)V
    .registers 3
    .param p2, "callback"    # Landroid/view/Window$Callback;

    .prologue
    .line 254
    iput-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    .line 255
    invoke-direct {p0, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;-><init>(Landroid/view/Window$Callback;)V

    .line 256
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 260
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegateImplBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 262
    const/4 v0, 0x1

    .line 265
    :goto_9
    return v0

    :cond_a
    invoke-super {p0, p1}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_9
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 315
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 316
    const/4 v0, 0x1

    .line 318
    :goto_d
    return v0

    :cond_e
    invoke-super {p0, p1}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_d
.end method

.method public onContentChanged()V
    .registers 1

    .prologue
    .line 325
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 270
    if-nez p1, :cond_8

    instance-of v0, p2, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v0, :cond_8

    .line 273
    const/4 v0, 0x0

    .line 275
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_7
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 307
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 308
    const/4 v0, 0x1

    .line 310
    :goto_9
    return v0

    :cond_a
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v0

    goto :goto_9
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .registers 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 329
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase;->this$0:Landroid/support/v7/app/AppCompatDelegateImplBase;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegateImplBase;->onPanelClosed(ILandroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 333
    :goto_8
    return-void

    .line 332
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onPanelClosed(ILandroid/view/Menu;)V

    goto :goto_8
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 8
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v3, 0x0

    .line 280
    instance-of v2, p3, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_f

    move-object v2, p3

    check-cast v2, Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-object v1, v2

    .line 282
    .local v1, "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :goto_9
    if-nez p1, :cond_11

    if-nez v1, :cond_11

    move v0, v3

    .line 302
    :cond_e
    :goto_e
    return v0

    .line 280
    .end local v1    # "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_f
    const/4 v1, 0x0

    goto :goto_9

    .line 292
    .restart local v1    # "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_11
    if-eqz v1, :cond_17

    .line 293
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setOverrideVisibleItems(Z)V

    .line 296
    :cond_17
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    .line 298
    .local v0, "handled":Z
    if-eqz v1, :cond_e

    .line 299
    invoke-virtual {v1, v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setOverrideVisibleItems(Z)V

    goto :goto_e
.end method
