.class public Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;
.super Landroid/support/v7/view/ActionMode;
.source "WindowDecorActionBar.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/app/WindowDecorActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ActionModeImpl"
.end annotation


# instance fields
.field private final mActionModeContext:Landroid/content/Context;

.field private mCallback:Landroid/support/v7/view/ActionMode$Callback;

.field private mCustomView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field final synthetic this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;


# direct methods
.method public constructor <init>(Landroid/support/v7/internal/app/WindowDecorActionBar;Landroid/content/Context;Landroid/support/v7/view/ActionMode$Callback;)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    .line 959
    iput-object p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    invoke-direct {p0}, Landroid/support/v7/view/ActionMode;-><init>()V

    .line 960
    iput-object p2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mActionModeContext:Landroid/content/Context;

    .line 961
    iput-object p3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 962
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v0, p2}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setDefaultShowAsAction(I)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 964
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 965
    return-void
.end method


# virtual methods
.method public dispatchOnCreate()Z
    .registers 3

    .prologue
    .line 1026
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1028
    :try_start_5
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/ActionMode$Callback;->onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_13

    move-result v0

    .line 1030
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    return v0

    :catchall_13
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    throw v0
.end method

.method public finish()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 979
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iget-object v0, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    if-eq v0, p0, :cond_9

    .line 1006
    :goto_8
    return-void

    .line 988
    :cond_9
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$700(Landroid/support/v7/internal/app/WindowDecorActionBar;)Z

    move-result v0

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z
    invoke-static {v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$800(Landroid/support/v7/internal/app/WindowDecorActionBar;)Z

    move-result v1

    # invokes: Landroid/support/v7/internal/app/WindowDecorActionBar;->checkShowingFlags(ZZZ)Z
    invoke-static {v0, v1, v2}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$900(ZZZ)Z

    move-result v0

    if-nez v0, :cond_56

    .line 991
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iput-object p0, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredDestroyActionMode:Landroid/support/v7/view/ActionMode;

    .line 992
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iput-object v1, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 996
    :goto_25
    iput-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 997
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/app/WindowDecorActionBar;->animateToMode(Z)V

    .line 1000
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->closeMode()V

    .line 1001
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1100(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/DecorToolbar;

    move-result-object v0

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 1003
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$600(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iget-boolean v1, v1, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideOnContentScroll:Z

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 1005
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iput-object v3, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    goto :goto_8

    .line 994
    :cond_56
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-interface {v0, p0}, Landroid/support/v7/view/ActionMode$Callback;->onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V

    goto :goto_25
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1083
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 974
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .prologue
    .line 969
    new-instance v0, Landroid/support/v7/internal/view/SupportMenuInflater;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mActionModeContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1067
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1062
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public invalidate()V
    .registers 3

    .prologue
    .line 1010
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    iget-object v0, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    if-eq v0, p0, :cond_7

    .line 1023
    :goto_6
    return-void

    .line 1017
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1019
    :try_start_c
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, p0, v1}, Landroid/support/v7/view/ActionMode$Callback;->onPrepareActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    :try_end_13
    .catchall {:try_start_c .. :try_end_13} :catchall_19

    .line 1021
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    goto :goto_6

    :catchall_19
    move-exception v0

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    throw v0
.end method

.method public isTitleOptional()Z
    .registers 2

    .prologue
    .line 1078
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->isTitleOptional()Z

    move-result v0

    return v0
.end method

.method public onMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 1087
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-eqz v0, :cond_b

    .line 1088
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-interface {v0, p0, p2}, Landroid/support/v7/view/ActionMode$Callback;->onActionItemClicked(Landroid/support/v7/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result v0

    .line 1090
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 3
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 1114
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-nez v0, :cond_5

    .line 1119
    :goto_4
    return-void

    .line 1117
    :cond_5
    invoke-virtual {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->invalidate()V

    .line 1118
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->showOverflowMenu()Z

    goto :goto_4
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1036
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    .line 1037
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->mCustomView:Ljava/lang/ref/WeakReference;

    .line 1038
    return-void
.end method

.method public setSubtitle(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 1057
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1200(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 1058
    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 1042
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 1043
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 1052
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1200(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->setTitle(Ljava/lang/CharSequence;)V

    .line 1053
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 1047
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    .line 1048
    return-void
.end method

.method public setTitleOptionalHint(Z)V
    .registers 3
    .param p1, "titleOptional"    # Z

    .prologue
    .line 1072
    invoke-super {p0, p1}, Landroid/support/v7/view/ActionMode;->setTitleOptionalHint(Z)V

    .line 1073
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->this$0:Landroid/support/v7/internal/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;
    invoke-static {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setTitleOptional(Z)V

    .line 1074
    return-void
.end method
