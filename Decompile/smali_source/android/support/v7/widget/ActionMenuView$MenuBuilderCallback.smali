.class Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;
.super Ljava/lang/Object;
.source "ActionMenuView.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ActionMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MenuBuilderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/ActionMenuView;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/ActionMenuView;)V
    .registers 2

    .prologue
    .line 737
    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;->this$0:Landroid/support/v7/widget/ActionMenuView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/ActionMenuView;Landroid/support/v7/widget/ActionMenuView$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/widget/ActionMenuView;
    .param p2, "x1"    # Landroid/support/v7/widget/ActionMenuView$1;

    .prologue
    .line 737
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;-><init>(Landroid/support/v7/widget/ActionMenuView;)V

    return-void
.end method


# virtual methods
.method public onMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 740
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;->this$0:Landroid/support/v7/widget/ActionMenuView;

    # getter for: Landroid/support/v7/widget/ActionMenuView;->mOnMenuItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;
    invoke-static {v0}, Landroid/support/v7/widget/ActionMenuView;->access$200(Landroid/support/v7/widget/ActionMenuView;)Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;->this$0:Landroid/support/v7/widget/ActionMenuView;

    # getter for: Landroid/support/v7/widget/ActionMenuView;->mOnMenuItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;
    invoke-static {v0}, Landroid/support/v7/widget/ActionMenuView;->access$200(Landroid/support/v7/widget/ActionMenuView;)Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

    move-result-object v0

    invoke-interface {v0, p2}, Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 3
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 746
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;->this$0:Landroid/support/v7/widget/ActionMenuView;

    # getter for: Landroid/support/v7/widget/ActionMenuView;->mMenuBuilderCallback:Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;
    invoke-static {v0}, Landroid/support/v7/widget/ActionMenuView;->access$300(Landroid/support/v7/widget/ActionMenuView;)Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 747
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;->this$0:Landroid/support/v7/widget/ActionMenuView;

    # getter for: Landroid/support/v7/widget/ActionMenuView;->mMenuBuilderCallback:Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;
    invoke-static {v0}, Landroid/support/v7/widget/ActionMenuView;->access$300(Landroid/support/v7/widget/ActionMenuView;)Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;->onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 749
    :cond_11
    return-void
.end method
