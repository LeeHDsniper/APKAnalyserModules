.class public Landroid/support/v7/internal/app/ToolbarActionBar;
.super Landroid/support/v7/app/ActionBar;
.source "ToolbarActionBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/app/ToolbarActionBar$MenuBuilderCallback;,
        Landroid/support/v7/internal/app/ToolbarActionBar$PanelMenuPresenterCallback;,
        Landroid/support/v7/internal/app/ToolbarActionBar$ActionMenuPresenterCallback;,
        Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;
    }
.end annotation


# instance fields
.field private mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

.field private mLastMenuVisibility:Z

.field private mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

.field private mMenuCallbackSet:Z

.field private final mMenuClicker:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

.field private final mMenuInvalidator:Ljava/lang/Runnable;

.field private mMenuVisibilityListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;",
            ">;"
        }
    .end annotation
.end field

.field private mToolbarMenuPrepared:Z

.field private mWindowCallback:Landroid/view/Window$Callback;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/Toolbar;Ljava/lang/CharSequence;Landroid/view/Window$Callback;)V
    .registers 6
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p2, "title"    # Ljava/lang/CharSequence;
    .param p3, "callback"    # Landroid/view/Window$Callback;

    .prologue
    .line 76
    invoke-direct {p0}, Landroid/support/v7/app/ActionBar;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    .line 61
    new-instance v0, Landroid/support/v7/internal/app/ToolbarActionBar$1;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/app/ToolbarActionBar$1;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuInvalidator:Ljava/lang/Runnable;

    .line 68
    new-instance v0, Landroid/support/v7/internal/app/ToolbarActionBar$2;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/app/ToolbarActionBar$2;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuClicker:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    .line 77
    new-instance v0, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/support/v7/internal/widget/ToolbarWidgetWrapper;-><init>(Landroid/support/v7/widget/Toolbar;Z)V

    iput-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    .line 78
    new-instance v0, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;

    invoke-direct {v0, p0, p3}, Landroid/support/v7/internal/app/ToolbarActionBar$ToolbarCallbackWrapper;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/view/Window$Callback;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    .line 79
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    invoke-interface {v0, v1}, Landroid/support/v7/internal/widget/DecorToolbar;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 80
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuClicker:Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/Toolbar;->setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V

    .line 81
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0, p2}, Landroid/support/v7/internal/widget/DecorToolbar;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 82
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/app/ToolbarActionBar;)Landroid/view/Window$Callback;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/ToolbarActionBar;

    .prologue
    .line 50
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v7/internal/app/ToolbarActionBar;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/ToolbarActionBar;

    .prologue
    .line 50
    iget-boolean v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mToolbarMenuPrepared:Z

    return v0
.end method

.method static synthetic access$202(Landroid/support/v7/internal/app/ToolbarActionBar;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/ToolbarActionBar;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mToolbarMenuPrepared:Z

    return p1
.end method

.method static synthetic access$300(Landroid/support/v7/internal/app/ToolbarActionBar;)Landroid/support/v7/internal/widget/DecorToolbar;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/ToolbarActionBar;

    .prologue
    .line 50
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/view/Menu;)Landroid/view/View;
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/internal/app/ToolbarActionBar;
    .param p1, "x1"    # Landroid/view/Menu;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Landroid/support/v7/internal/app/ToolbarActionBar;->getListMenuView(Landroid/view/Menu;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private ensureListMenuPresenter(Landroid/view/Menu;)V
    .registers 10
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v6, 0x1

    .line 504
    iget-object v5, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-nez v5, :cond_68

    instance-of v5, p1, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v5, :cond_68

    move-object v2, p1

    .line 505
    check-cast v2, Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 507
    .local v2, "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    iget-object v5, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v5}, Landroid/support/v7/internal/widget/DecorToolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 508
    .local v0, "context":Landroid/content/Context;
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 509
    .local v3, "outValue":Landroid/util/TypedValue;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    .line 510
    .local v4, "widgetTheme":Landroid/content/res/Resources$Theme;
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 513
    sget v5, Landroid/support/v7/appcompat/R$attr;->actionBarPopupTheme:I

    invoke-virtual {v4, v5, v3, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 514
    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_34

    .line 515
    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 519
    :cond_34
    sget v5, Landroid/support/v7/appcompat/R$attr;->panelMenuListTheme:I

    invoke-virtual {v4, v5, v3, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 520
    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_69

    .line 521
    iget v5, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 526
    :goto_42
    new-instance v1, Landroid/view/ContextThemeWrapper;

    const/4 v5, 0x0

    invoke-direct {v1, v0, v5}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 527
    .end local v0    # "context":Landroid/content/Context;
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 530
    new-instance v5, Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    sget v6, Landroid/support/v7/appcompat/R$layout;->abc_list_menu_item_layout:I

    invoke-direct {v5, v1, v6}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    .line 531
    iget-object v5, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    new-instance v6, Landroid/support/v7/internal/app/ToolbarActionBar$PanelMenuPresenterCallback;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Landroid/support/v7/internal/app/ToolbarActionBar$PanelMenuPresenterCallback;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/support/v7/internal/app/ToolbarActionBar$1;)V

    invoke-virtual {v5, v6}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 532
    iget-object v5, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v2, v5}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 534
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    .end local v3    # "outValue":Landroid/util/TypedValue;
    .end local v4    # "widgetTheme":Landroid/content/res/Resources$Theme;
    :cond_68
    return-void

    .line 523
    .restart local v0    # "context":Landroid/content/Context;
    .restart local v2    # "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    .restart local v3    # "outValue":Landroid/util/TypedValue;
    .restart local v4    # "widgetTheme":Landroid/content/res/Resources$Theme;
    :cond_69
    sget v5, Landroid/support/v7/appcompat/R$style;->Theme_AppCompat_CompactMenu:I

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    goto :goto_42
.end method

.method private getListMenuView(Landroid/view/Menu;)Landroid/view/View;
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v0, 0x0

    .line 491
    invoke-direct {p0, p1}, Landroid/support/v7/internal/app/ToolbarActionBar;->ensureListMenuPresenter(Landroid/view/Menu;)V

    .line 493
    if-eqz p1, :cond_a

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-nez v1, :cond_b

    .line 500
    :cond_a
    :goto_a
    return-object v0

    .line 497
    :cond_b
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_a

    .line 498
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorToolbar;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_a
.end method

.method private getMenu()Landroid/view/Menu;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 566
    iget-boolean v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuCallbackSet:Z

    if-nez v0, :cond_17

    .line 567
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    new-instance v1, Landroid/support/v7/internal/app/ToolbarActionBar$ActionMenuPresenterCallback;

    invoke-direct {v1, p0, v3}, Landroid/support/v7/internal/app/ToolbarActionBar$ActionMenuPresenterCallback;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/support/v7/internal/app/ToolbarActionBar$1;)V

    new-instance v2, Landroid/support/v7/internal/app/ToolbarActionBar$MenuBuilderCallback;

    invoke-direct {v2, p0, v3}, Landroid/support/v7/internal/app/ToolbarActionBar$MenuBuilderCallback;-><init>(Landroid/support/v7/internal/app/ToolbarActionBar;Landroid/support/v7/internal/app/ToolbarActionBar$1;)V

    invoke-interface {v0, v1, v2}, Landroid/support/v7/internal/widget/DecorToolbar;->setMenuCallbacks(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 569
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuCallbackSet:Z

    .line 571
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public collapseActionView()Z
    .registers 2

    .prologue
    .line 430
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->hasExpandedActionView()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 431
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->collapseActionView()V

    .line 432
    const/4 v0, 0x1

    .line 434
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public dispatchMenuVisibilityChanged(Z)V
    .registers 5
    .param p1, "isVisible"    # Z

    .prologue
    .line 479
    iget-boolean v2, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mLastMenuVisibility:Z

    if-ne p1, v2, :cond_5

    .line 488
    :cond_4
    return-void

    .line 482
    :cond_5
    iput-boolean p1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mLastMenuVisibility:Z

    .line 484
    iget-object v2, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 485
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v0, :cond_4

    .line 486
    iget-object v2, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;

    invoke-interface {v2, p1}, Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;->onMenuVisibilityChanged(Z)V

    .line 485
    add-int/lit8 v1, v1, 0x1

    goto :goto_e
.end method

.method public getDisplayOptions()I
    .registers 2

    .prologue
    .line 318
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getHeight()I

    move-result v0

    return v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getWrappedWindowCallback()Landroid/view/Window$Callback;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    return-object v0
.end method

.method public hide()V
    .registers 3

    .prologue
    .line 408
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    const/16 v1, 0x8

    invoke-interface {v0, v1}, Landroid/support/v7/internal/widget/DecorToolbar;->setVisibility(I)V

    .line 409
    return-void
.end method

.method public invalidateOptionsMenu()Z
    .registers 3

    .prologue
    .line 423
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuInvalidator:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 424
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mMenuInvalidator:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 425
    const/4 v0, 0x1

    return v0
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 413
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2
    .param p1, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 192
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBar;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 193
    return-void
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "ev"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 466
    invoke-direct {p0}, Landroid/support/v7/internal/app/ToolbarActionBar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 467
    .local v0, "menu":Landroid/view/Menu;
    if-eqz v0, :cond_b

    invoke-interface {v0, p1, p2, v1}, Landroid/view/Menu;->performShortcut(ILandroid/view/KeyEvent;I)Z

    move-result v1

    :cond_b
    return v1
.end method

.method populateOptionsMenu()V
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 438
    invoke-direct {p0}, Landroid/support/v7/internal/app/ToolbarActionBar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    .line 439
    .local v1, "menu":Landroid/view/Menu;
    instance-of v2, v1, Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_d

    move-object v2, v1

    check-cast v2, Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-object v0, v2

    .line 440
    .local v0, "mb":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_d
    if-eqz v0, :cond_12

    .line 441
    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 444
    :cond_12
    :try_start_12
    invoke-interface {v1}, Landroid/view/Menu;->clear()V

    .line 445
    iget-object v2, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    const/4 v3, 0x0

    invoke-interface {v2, v3, v1}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_28

    iget-object v2, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mWindowCallback:Landroid/view/Window$Callback;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4, v1}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v2

    if-nez v2, :cond_2b

    .line 447
    :cond_28
    invoke-interface {v1}, Landroid/view/Menu;->clear()V
    :try_end_2b
    .catchall {:try_start_12 .. :try_end_2b} :catchall_31

    .line 450
    :cond_2b
    if-eqz v0, :cond_30

    .line 451
    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 454
    :cond_30
    return-void

    .line 450
    :catchall_31
    move-exception v2

    if-eqz v0, :cond_37

    .line 451
    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    :cond_37
    throw v2
.end method

.method public setDefaultDisplayHomeAsUpEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 178
    return-void
.end method

.method public setDisplayHomeAsUpEnabled(Z)V
    .registers 4
    .param p1, "showHomeAsUp"    # Z

    .prologue
    const/4 v1, 0x4

    .line 270
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->setDisplayOptions(II)V

    .line 271
    return-void

    .line 270
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setDisplayOptions(I)V
    .registers 3
    .param p1, "options"    # I

    .prologue
    .line 249
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/internal/app/ToolbarActionBar;->setDisplayOptions(II)V

    .line 250
    return-void
.end method

.method public setDisplayOptions(II)V
    .registers 7
    .param p1, "options"    # I
    .param p2, "mask"    # I

    .prologue
    .line 254
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorToolbar;->getDisplayOptions()I

    move-result v0

    .line 255
    .local v0, "currentOptions":I
    iget-object v1, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    and-int v2, p1, p2

    xor-int/lit8 v3, p2, -0x1

    and-int/2addr v3, v0

    or-int/2addr v2, v3

    invoke-interface {v1, v2}, Landroid/support/v7/internal/widget/DecorToolbar;->setDisplayOptions(I)V

    .line 256
    return-void
.end method

.method public setDisplayShowHomeEnabled(Z)V
    .registers 4
    .param p1, "showHome"    # Z

    .prologue
    const/4 v1, 0x2

    .line 265
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->setDisplayOptions(II)V

    .line 266
    return-void

    .line 265
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setElevation(F)V
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 142
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getViewGroup()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 143
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 138
    return-void
.end method

.method public setShowHideAnimationEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 188
    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 234
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0, p1}, Landroid/support/v7/internal/widget/DecorToolbar;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 235
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    .line 401
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/support/v7/internal/widget/DecorToolbar;->setVisibility(I)V

    .line 402
    return-void
.end method
