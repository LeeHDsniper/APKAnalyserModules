.class Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;
.super Landroid/support/v7/internal/view/WindowCallbackWrapper;
.source "ToolbarActionBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/app/ToolbarActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ToolbarCallbackWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/internal/app/ToolbarActionBar;


# direct methods
.method public constructor <init>(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/view/Window$Callback;)V
    .registers 3
    .param p2, "wrapped"    # Landroid/view/Window$Callback;

    .prologue
    .line 537
    iput-object p1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    .line 538
    invoke-direct {p0, p2}, Landroid/support/v7/internal/view/WindowCallbackWrapper;-><init>(Landroid/view/Window$Callback;)V

    .line 539
    return-void
.end method


# virtual methods
.method public onCreatePanelView(I)Landroid/view/View;
    .registers 4
    .param p1, "featureId"    # I

    .prologue
    .line 553
    packed-switch p1, :pswitch_data_26

    .line 561
    :cond_3
    invoke-super {p0, p1}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v1

    :goto_7
    return-object v1

    .line 555
    :pswitch_8
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    # getter for: Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;
    invoke-static {v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->access$300(Landroid/support/v7/internal/app/ToolbarActionBar;)Landroid/support/v7/internal/widget/DecorToolbar;

    move-result-object v1

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorToolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 556
    .local v0, "menu":Landroid/view/Menu;
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 557
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    # invokes: Landroid/support/v7/internal/app/ToolbarActionBar;->getListMenuView(Landroid/view/Menu;)Landroid/view/View;
    invoke-static {v1, v0}, Landroid/support/v7/internal/app/ToolbarActionBar;->access$400(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/view/Menu;)Landroid/view/View;

    move-result-object v1

    goto :goto_7

    .line 553
    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .registers 7
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    .line 543
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/internal/view/WindowCallbackWrapper;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    .line 544
    .local v0, "result":Z
    if-eqz v0, :cond_1d

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    # getter for: Landroid/support/v7/internal/app/ToolbarActionBar;->mToolbarMenuPrepared:Z
    invoke-static {v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->access$200(Landroid/support/v7/internal/app/ToolbarActionBar;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 545
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    # getter for: Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;
    invoke-static {v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->access$300(Landroid/support/v7/internal/app/ToolbarActionBar;)Landroid/support/v7/internal/widget/DecorToolbar;

    move-result-object v1

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorToolbar;->setMenuPrepared()V

    .line 546
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    const/4 v2, 0x1

    # setter for: Landroid/support/v7/internal/app/ToolbarActionBar;->mToolbarMenuPrepared:Z
    invoke-static {v1, v2}, Landroid/support/v7/internal/app/ToolbarActionBar;->access$202(Landroid/support/v7/internal/app/ToolbarActionBar;Z)Z

    .line 548
    :cond_1d
    return v0
.end method
