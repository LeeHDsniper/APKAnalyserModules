.class public Landroid/support/v7/internal/app/WindowDecorActionBar;
.super Landroid/support/v7/app/ActionBar;
.source "WindowDecorActionBar.java"

# interfaces
.implements Landroid/support/v7/internal/widget/ActionBarOverlayLayout$ActionBarVisibilityCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ALLOW_SHOW_HIDE_ANIMATIONS:Z


# instance fields
.field mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

.field private mActivity:Landroid/app/Activity;

.field private mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

.field private mContentAnimations:Z

.field private mContentView:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mContextDisplayMode:I

.field private mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

.field private mCurWindowVisibility:I

.field private mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

.field private mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

.field mDeferredDestroyActionMode:Landroid/support/v7/view/ActionMode;

.field mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

.field private mDialog:Landroid/app/Dialog;

.field private mDisplayHomeAsUpSet:Z

.field private mHasEmbeddedTabs:Z

.field private mHiddenByApp:Z

.field private mHiddenBySystem:Z

.field final mHideListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

.field mHideOnContentScroll:Z

.field private mLastMenuVisibility:Z

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

.field private mNowShowing:Z

.field private mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

.field private mSavedTabPosition:I

.field private mShowHideAnimationEnabled:Z

.field final mShowListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

.field private mShowingForMode:Z

.field private mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

.field private mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

.field private mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mThemedContext:Landroid/content/Context;

.field final mUpdateListener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 75
    const-class v0, Landroid/support/v7/internal/app/WindowDecorActionBar;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_16

    move v0, v1

    :goto_b
    sput-boolean v0, Landroid/support/v7/internal/app/WindowDecorActionBar;->$assertionsDisabled:Z

    .line 82
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v0, v3, :cond_18

    :goto_13
    sput-boolean v1, Landroid/support/v7/internal/app/WindowDecorActionBar;->ALLOW_SHOW_HIDE_ANIMATIONS:Z

    return-void

    :cond_16
    move v0, v2

    .line 75
    goto :goto_b

    :cond_18
    move v1, v2

    .line 82
    goto :goto_13
.end method

.method public constructor <init>(Landroid/app/Activity;Z)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "overlayMode"    # Z

    .prologue
    const/4 v3, 0x1

    .line 172
    invoke-direct {p0}, Landroid/support/v7/app/ActionBar;-><init>()V

    .line 97
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabs:Ljava/util/ArrayList;

    .line 100
    const/4 v2, -0x1

    iput v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSavedTabPosition:I

    .line 109
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    .line 120
    const/4 v2, 0x0

    iput v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurWindowVisibility:I

    .line 122
    iput-boolean v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    .line 127
    iput-boolean v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    .line 135
    new-instance v2, Landroid/support/v7/internal/app/WindowDecorActionBar$1;

    invoke-direct {v2, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$1;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    .line 155
    new-instance v2, Landroid/support/v7/internal/app/WindowDecorActionBar$2;

    invoke-direct {v2, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$2;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    .line 163
    new-instance v2, Landroid/support/v7/internal/app/WindowDecorActionBar$3;

    invoke-direct {v2, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$3;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mUpdateListener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    .line 173
    iput-object p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActivity:Landroid/app/Activity;

    .line 174
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 175
    .local v1, "window":Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 176
    .local v0, "decor":Landroid/view/View;
    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->init(Landroid/view/View;)V

    .line 177
    if-nez p2, :cond_49

    .line 178
    const v2, 0x1020002

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    .line 180
    :cond_49
    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;)V
    .registers 4
    .param p1, "dialog"    # Landroid/app/Dialog;

    .prologue
    const/4 v1, 0x1

    .line 182
    invoke-direct {p0}, Landroid/support/v7/app/ActionBar;-><init>()V

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabs:Ljava/util/ArrayList;

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSavedTabPosition:I

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    .line 120
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurWindowVisibility:I

    .line 122
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    .line 127
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    .line 135
    new-instance v0, Landroid/support/v7/internal/app/WindowDecorActionBar$1;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$1;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    .line 155
    new-instance v0, Landroid/support/v7/internal/app/WindowDecorActionBar$2;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$2;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    .line 163
    new-instance v0, Landroid/support/v7/internal/app/WindowDecorActionBar$3;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/app/WindowDecorActionBar$3;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;)V

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mUpdateListener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    .line 183
    iput-object p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDialog:Landroid/app/Dialog;

    .line 184
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->init(Landroid/view/View;)V

    .line 185
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    return v0
.end method

.method static synthetic access$100(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1000(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContextView;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    return-object v0
.end method

.method static synthetic access$1100(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/DecorToolbar;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    return-object v0
.end method

.method static synthetic access$1200(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContainer;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarContainer;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v7/internal/app/WindowDecorActionBar;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextDisplayMode:I

    return v0
.end method

.method static synthetic access$502(Landroid/support/v7/internal/app/WindowDecorActionBar;Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;
    .param p1, "x1"    # Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .prologue
    .line 75
    iput-object p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    return-object p1
.end method

.method static synthetic access$600(Landroid/support/v7/internal/app/WindowDecorActionBar;)Landroid/support/v7/internal/widget/ActionBarOverlayLayout;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/v7/internal/app/WindowDecorActionBar;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    return v0
.end method

.method static synthetic access$800(Landroid/support/v7/internal/app/WindowDecorActionBar;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/app/WindowDecorActionBar;

    .prologue
    .line 75
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    return v0
.end method

.method static synthetic access$900(ZZZ)Z
    .registers 4
    .param p0, "x0"    # Z
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 75
    invoke-static {p0, p1, p2}, Landroid/support/v7/internal/app/WindowDecorActionBar;->checkShowingFlags(ZZZ)Z

    move-result v0

    return v0
.end method

.method private static checkShowingFlags(ZZZ)Z
    .registers 4
    .param p0, "hiddenByApp"    # Z
    .param p1, "hiddenBySystem"    # Z
    .param p2, "showingForMode"    # Z

    .prologue
    const/4 v0, 0x1

    .line 744
    if-eqz p2, :cond_4

    .line 749
    :cond_3
    :goto_3
    return v0

    .line 746
    :cond_4
    if-nez p0, :cond_8

    if-eqz p1, :cond_3

    .line 747
    :cond_8
    const/4 v0, 0x0

    goto :goto_3
.end method

.method private getDecorToolbar(Landroid/view/View;)Landroid/support/v7/internal/widget/DecorToolbar;
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 243
    instance-of v0, p1, Landroid/support/v7/internal/widget/DecorToolbar;

    if-eqz v0, :cond_7

    .line 244
    check-cast p1, Landroid/support/v7/internal/widget/DecorToolbar;

    .line 246
    .end local p1    # "view":Landroid/view/View;
    :goto_6
    return-object p1

    .line 245
    .restart local p1    # "view":Landroid/view/View;
    :cond_7
    instance-of v0, p1, Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_12

    .line 246
    check-cast p1, Landroid/support/v7/widget/Toolbar;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getWrapper()Landroid/support/v7/internal/widget/DecorToolbar;

    move-result-object p1

    goto :goto_6

    .line 248
    .restart local p1    # "view":Landroid/view/View;
    :cond_12
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t make a decor toolbar out of "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_35

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :goto_31
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_35
    const-string v0, "null"

    goto :goto_31
.end method

.method private hideForActionMode()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 697
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowingForMode:Z

    if-eqz v0, :cond_13

    .line 698
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowingForMode:Z

    .line 699
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_10

    .line 700
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    .line 702
    :cond_10
    invoke-direct {p0, v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 704
    :cond_13
    return-void
.end method

.method private init(Landroid/view/View;)V
    .registers 13
    .param p1, "decor"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 197
    sget v5, Landroid/support/v7/appcompat/R$id;->decor_content_parent:I

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    .line 198
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v5, :cond_15

    .line 199
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v5, p0}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setActionBarVisibilityCallback(Landroid/support/v7/internal/widget/ActionBarOverlayLayout$ActionBarVisibilityCallback;)V

    .line 201
    :cond_15
    sget v5, Landroid/support/v7/appcompat/R$id;->action_bar:I

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-direct {p0, v5}, Landroid/support/v7/internal/app/WindowDecorActionBar;->getDecorToolbar(Landroid/view/View;)Landroid/support/v7/internal/widget/DecorToolbar;

    move-result-object v5

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    .line 202
    sget v5, Landroid/support/v7/appcompat/R$id;->action_context_bar:I

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/internal/widget/ActionBarContextView;

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    .line 204
    sget v5, Landroid/support/v7/appcompat/R$id;->action_bar_container:I

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/internal/widget/ActionBarContainer;

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    .line 207
    sget v5, Landroid/support/v7/appcompat/R$id;->split_action_bar:I

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/internal/widget/ActionBarContainer;

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    .line 209
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    if-eqz v5, :cond_4b

    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    if-eqz v5, :cond_4b

    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-nez v5, :cond_72

    .line 210
    :cond_4b
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " can only be used "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "with a compatible window decor layout"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 214
    :cond_72
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v5}, Landroid/support/v7/internal/widget/DecorToolbar;->getContext()Landroid/content/Context;

    move-result-object v5

    iput-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    .line 215
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v5}, Landroid/support/v7/internal/widget/DecorToolbar;->isSplit()Z

    move-result v5

    if-eqz v5, :cond_d3

    move v5, v6

    :goto_83
    iput v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextDisplayMode:I

    .line 219
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v5}, Landroid/support/v7/internal/widget/DecorToolbar;->getDisplayOptions()I

    move-result v2

    .line 220
    .local v2, "current":I
    and-int/lit8 v5, v2, 0x4

    if-eqz v5, :cond_d5

    move v4, v6

    .line 221
    .local v4, "homeAsUp":Z
    :goto_90
    if-eqz v4, :cond_94

    .line 222
    iput-boolean v6, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDisplayHomeAsUpSet:Z

    .line 225
    :cond_94
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/support/v7/internal/view/ActionBarPolicy;->get(Landroid/content/Context;)Landroid/support/v7/internal/view/ActionBarPolicy;

    move-result-object v1

    .line 226
    .local v1, "abp":Landroid/support/v7/internal/view/ActionBarPolicy;
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ActionBarPolicy;->enableHomeButtonByDefault()Z

    move-result v5

    if-nez v5, :cond_a2

    if-eqz v4, :cond_d7

    :cond_a2
    move v5, v6

    :goto_a3
    invoke-virtual {p0, v5}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setHomeButtonEnabled(Z)V

    .line 227
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ActionBarPolicy;->hasEmbeddedTabs()Z

    move-result v5

    invoke-direct {p0, v5}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setHasEmbeddedTabs(Z)V

    .line 229
    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    const/4 v8, 0x0

    sget-object v9, Landroid/support/v7/appcompat/R$styleable;->ActionBar:[I

    sget v10, Landroid/support/v7/appcompat/R$attr;->actionBarStyle:I

    invoke-virtual {v5, v8, v9, v10, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 232
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v5, Landroid/support/v7/appcompat/R$styleable;->ActionBar_hideOnContentScroll:I

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    if-eqz v5, :cond_c3

    .line 233
    invoke-virtual {p0, v6}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setHideOnContentScrollEnabled(Z)V

    .line 235
    :cond_c3
    sget v5, Landroid/support/v7/appcompat/R$styleable;->ActionBar_elevation:I

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 236
    .local v3, "elevation":I
    if-eqz v3, :cond_cf

    .line 237
    int-to-float v5, v3

    invoke-virtual {p0, v5}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setElevation(F)V

    .line 239
    :cond_cf
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 240
    return-void

    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "abp":Landroid/support/v7/internal/view/ActionBarPolicy;
    .end local v2    # "current":I
    .end local v3    # "elevation":I
    .end local v4    # "homeAsUp":Z
    :cond_d3
    move v5, v7

    .line 215
    goto :goto_83

    .restart local v2    # "current":I
    :cond_d5
    move v4, v7

    .line 220
    goto :goto_90

    .restart local v1    # "abp":Landroid/support/v7/internal/view/ActionBarPolicy;
    .restart local v4    # "homeAsUp":Z
    :cond_d7
    move v5, v7

    .line 226
    goto :goto_a3
.end method

.method private setHasEmbeddedTabs(Z)V
    .registers 7
    .param p1, "hasEmbeddedTabs"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 271
    iput-boolean p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHasEmbeddedTabs:Z

    .line 273
    iget-boolean v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHasEmbeddedTabs:Z

    if-nez v3, :cond_49

    .line 274
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v3, v4}, Landroid/support/v7/internal/widget/DecorToolbar;->setEmbeddedTabView(Landroid/support/v7/internal/widget/ScrollingTabContainerView;)V

    .line 275
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v3, v4}, Landroid/support/v7/internal/widget/ActionBarContainer;->setTabContainer(Landroid/support/v7/internal/widget/ScrollingTabContainerView;)V

    .line 280
    :goto_15
    invoke-virtual {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->getNavigationMode()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_56

    move v0, v1

    .line 281
    .local v0, "isInTabMode":Z
    :goto_1d
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    if-eqz v3, :cond_31

    .line 282
    if-eqz v0, :cond_58

    .line 283
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    invoke-virtual {v3, v2}, Landroid/support/v7/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 284
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v3, :cond_31

    .line 285
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->requestApplyInsets(Landroid/view/View;)V

    .line 291
    :cond_31
    :goto_31
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    iget-boolean v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHasEmbeddedTabs:Z

    if-nez v3, :cond_60

    if-eqz v0, :cond_60

    move v3, v1

    :goto_3a
    invoke-interface {v4, v3}, Landroid/support/v7/internal/widget/DecorToolbar;->setCollapsible(Z)V

    .line 292
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHasEmbeddedTabs:Z

    if-nez v4, :cond_62

    if-eqz v0, :cond_62

    :goto_45
    invoke-virtual {v3, v1}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setHasNonEmbeddedTabs(Z)V

    .line 293
    return-void

    .line 277
    .end local v0    # "isInTabMode":Z
    :cond_49
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v3, v4}, Landroid/support/v7/internal/widget/ActionBarContainer;->setTabContainer(Landroid/support/v7/internal/widget/ScrollingTabContainerView;)V

    .line 278
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    invoke-interface {v3, v4}, Landroid/support/v7/internal/widget/DecorToolbar;->setEmbeddedTabView(Landroid/support/v7/internal/widget/ScrollingTabContainerView;)V

    goto :goto_15

    :cond_56
    move v0, v2

    .line 280
    goto :goto_1d

    .line 288
    .restart local v0    # "isInTabMode":Z
    :cond_58
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/support/v7/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    goto :goto_31

    :cond_60
    move v3, v2

    .line 291
    goto :goto_3a

    :cond_62
    move v1, v2

    .line 292
    goto :goto_45
.end method

.method private showForActionMode()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 672
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowingForMode:Z

    if-nez v0, :cond_14

    .line 673
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowingForMode:Z

    .line 674
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_10

    .line 675
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    .line 677
    :cond_10
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 679
    :cond_14
    return-void
.end method

.method private updateVisibility(Z)V
    .registers 6
    .param p1, "fromSystem"    # Z

    .prologue
    .line 755
    iget-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    iget-boolean v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    iget-boolean v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowingForMode:Z

    invoke-static {v1, v2, v3}, Landroid/support/v7/internal/app/WindowDecorActionBar;->checkShowingFlags(ZZZ)Z

    move-result v0

    .line 758
    .local v0, "shown":Z
    if-eqz v0, :cond_17

    .line 759
    iget-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    if-nez v1, :cond_16

    .line 760
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    .line 761
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->doShow(Z)V

    .line 769
    :cond_16
    :goto_16
    return-void

    .line 764
    :cond_17
    iget-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    if-eqz v1, :cond_16

    .line 765
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    .line 766
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->doHide(Z)V

    goto :goto_16
.end method


# virtual methods
.method public animateToMode(Z)V
    .registers 6
    .param p1, "toActionMode"    # Z

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 876
    if-eqz p1, :cond_18

    .line 877
    invoke-direct {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->showForActionMode()V

    .line 882
    :goto_8
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    if-eqz p1, :cond_1c

    move v0, v1

    :goto_d
    invoke-interface {v3, v0}, Landroid/support/v7/internal/widget/DecorToolbar;->animateToVisibility(I)V

    .line 883
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    if-eqz p1, :cond_1e

    :goto_14
    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->animateToVisibility(I)V

    .line 885
    return-void

    .line 879
    :cond_18
    invoke-direct {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->hideForActionMode()V

    goto :goto_8

    :cond_1c
    move v0, v2

    .line 882
    goto :goto_d

    :cond_1e
    move v2, v1

    .line 883
    goto :goto_14
.end method

.method public collapseActionView()Z
    .registers 2

    .prologue
    .line 942
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->hasExpandedActionView()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 943
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->collapseActionView()V

    .line 944
    const/4 v0, 0x1

    .line 946
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method completeDeferredDestroyActionMode()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 320
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

    if-eqz v0, :cond_10

    .line 321
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredDestroyActionMode:Landroid/support/v7/view/ActionMode;

    invoke-interface {v0, v1}, Landroid/support/v7/view/ActionMode$Callback;->onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V

    .line 322
    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredDestroyActionMode:Landroid/support/v7/view/ActionMode;

    .line 323
    iput-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDeferredModeDestroyCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 325
    :cond_10
    return-void
.end method

.method public dispatchMenuVisibilityChanged(Z)V
    .registers 5
    .param p1, "isVisible"    # Z

    .prologue
    .line 354
    iget-boolean v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mLastMenuVisibility:Z

    if-ne p1, v2, :cond_5

    .line 363
    :cond_4
    return-void

    .line 357
    :cond_5
    iput-boolean p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mLastMenuVisibility:Z

    .line 359
    iget-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 360
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v0, :cond_4

    .line 361
    iget-object v2, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mMenuVisibilityListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;

    invoke-interface {v2, p1}, Landroid/support/v7/app/ActionBar$OnMenuVisibilityListener;->onMenuVisibilityChanged(Z)V

    .line 360
    add-int/lit8 v1, v1, 0x1

    goto :goto_e
.end method

.method public doHide(Z)V
    .registers 9
    .param p1, "fromSystem"    # Z

    .prologue
    const/4 v6, 0x1

    const/high16 v5, 0x3f800000

    .line 833
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    if-eqz v4, :cond_c

    .line 834
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-virtual {v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->cancel()V

    .line 837
    :cond_c
    iget v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurWindowVisibility:I

    if-nez v4, :cond_aa

    sget-boolean v4, Landroid/support/v7/internal/app/WindowDecorActionBar;->ALLOW_SHOW_HIDE_ANIMATIONS:Z

    if-eqz v4, :cond_aa

    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowHideAnimationEnabled:Z

    if-nez v4, :cond_1a

    if-eqz p1, :cond_aa

    .line 839
    :cond_1a
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 840
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v6}, Landroid/support/v7/internal/widget/ActionBarContainer;->setTransitioning(Z)V

    .line 841
    new-instance v1, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-direct {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;-><init>()V

    .line 842
    .local v1, "anim":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4}, Landroid/support/v7/internal/widget/ActionBarContainer;->getHeight()I

    move-result v4

    neg-int v4, v4

    int-to-float v2, v4

    .line 843
    .local v2, "endingY":F
    if-eqz p1, :cond_42

    .line 844
    const/4 v4, 0x2

    new-array v3, v4, [I

    fill-array-data v3, :array_b2

    .line 845
    .local v3, "topLeft":[I
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v3}, Landroid/support/v7/internal/widget/ActionBarContainer;->getLocationInWindow([I)V

    .line 846
    aget v4, v3, v6

    int-to-float v4, v4

    sub-float/2addr v2, v4

    .line 848
    .end local v3    # "topLeft":[I
    :cond_42
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 849
    .local v0, "a":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mUpdateListener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 850
    invoke-virtual {v1, v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 851
    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    if-eqz v4, :cond_69

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    if-eqz v4, :cond_69

    .line 852
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 854
    :cond_69
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v4, :cond_8e

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4}, Landroid/support/v7/internal/widget/ActionBarContainer;->getVisibility()I

    move-result v4

    if-nez v4, :cond_8e

    .line 855
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 856
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Landroid/support/v7/internal/widget/ActionBarContainer;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 858
    :cond_8e
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    const v5, 0x10a0005

    invoke-static {v4, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 860
    const-wide/16 v4, 0xfa

    invoke-virtual {v1, v4, v5}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setDuration(J)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 861
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 862
    iput-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 863
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->start()V

    .line 867
    .end local v0    # "a":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .end local v1    # "anim":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    .end local v2    # "endingY":F
    :goto_a9
    return-void

    .line 865
    :cond_aa
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationEnd(Landroid/view/View;)V

    goto :goto_a9

    .line 844
    nop

    :array_b2
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public doShow(Z)V
    .registers 11
    .param p1, "fromSystem"    # Z

    .prologue
    const/high16 v8, 0x3f800000

    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 772
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    if-eqz v4, :cond_e

    .line 773
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-virtual {v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->cancel()V

    .line 775
    :cond_e
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v7}, Landroid/support/v7/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 777
    iget v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurWindowVisibility:I

    if-nez v4, :cond_c0

    sget-boolean v4, Landroid/support/v7/internal/app/WindowDecorActionBar;->ALLOW_SHOW_HIDE_ANIMATIONS:Z

    if-eqz v4, :cond_c0

    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowHideAnimationEnabled:Z

    if-nez v4, :cond_21

    if-eqz p1, :cond_c0

    .line 780
    :cond_21
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v6}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 781
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4}, Landroid/support/v7/internal/widget/ActionBarContainer;->getHeight()I

    move-result v4

    neg-int v4, v4

    int-to-float v2, v4

    .line 782
    .local v2, "startingY":F
    if-eqz p1, :cond_3f

    .line 783
    const/4 v4, 0x2

    new-array v3, v4, [I

    fill-array-data v3, :array_f6

    .line 784
    .local v3, "topLeft":[I
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v3}, Landroid/support/v7/internal/widget/ActionBarContainer;->getLocationInWindow([I)V

    .line 785
    aget v4, v3, v5

    int-to-float v4, v4

    sub-float/2addr v2, v4

    .line 787
    .end local v3    # "topLeft":[I
    :cond_3f
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 788
    new-instance v1, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-direct {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;-><init>()V

    .line 789
    .local v1, "anim":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 790
    .local v0, "a":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mUpdateListener:Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 791
    invoke-virtual {v1, v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 792
    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    if-eqz v4, :cond_75

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    if-eqz v4, :cond_75

    .line 793
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    invoke-static {v4, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 794
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 796
    :cond_75
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v4, :cond_9b

    iget v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextDisplayMode:I

    if-ne v4, v5, :cond_9b

    .line 797
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    iget-object v5, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v5}, Landroid/support/v7/internal/widget/ActionBarContainer;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-static {v4, v5}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 798
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v7}, Landroid/support/v7/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 799
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->play(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 801
    :cond_9b
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    const v5, 0x10a0006

    invoke-static {v4, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 803
    const-wide/16 v4, 0xfa

    invoke-virtual {v1, v4, v5}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setDuration(J)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 811
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 812
    iput-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 813
    invoke-virtual {v1}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->start()V

    .line 827
    .end local v0    # "a":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .end local v1    # "anim":Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;
    .end local v2    # "startingY":F
    :goto_b6
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v4, :cond_bf

    .line 828
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->requestApplyInsets(Landroid/view/View;)V

    .line 830
    :cond_bf
    return-void

    .line 815
    :cond_c0
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v8}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 816
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v6}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 817
    iget-boolean v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    if-eqz v4, :cond_d7

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    if-eqz v4, :cond_d7

    .line 818
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentView:Landroid/view/View;

    invoke-static {v4, v6}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 820
    :cond_d7
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v4, :cond_ee

    iget v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextDisplayMode:I

    if-ne v4, v5, :cond_ee

    .line 821
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v8}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 822
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v4, v6}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 823
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v4, v7}, Landroid/support/v7/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 825
    :cond_ee
    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowListener:Landroid/support/v4/view/ViewPropertyAnimatorListener;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationEnd(Landroid/view/View;)V

    goto :goto_b6

    .line 783
    nop

    :array_f6
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public enableContentAnimations(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 660
    iput-boolean p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContentAnimations:Z

    .line 661
    return-void
.end method

.method public getDisplayOptions()I
    .registers 2

    .prologue
    .line 499
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 656
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarContainer;->getHeight()I

    move-result v0

    return v0
.end method

.method public getHideOffset()I
    .registers 2

    .prologue
    .line 730
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->getActionBarHideOffset()I

    move-result v0

    return v0
.end method

.method public getNavigationMode()I
    .registers 2

    .prologue
    .line 495
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorToolbar;->getNavigationMode()I

    move-result v0

    return v0
.end method

.method public getThemedContext()Landroid/content/Context;
    .registers 6

    .prologue
    .line 888
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mThemedContext:Landroid/content/Context;

    if-nez v3, :cond_22

    .line 889
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 890
    .local v1, "outValue":Landroid/util/TypedValue;
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 891
    .local v0, "currentTheme":Landroid/content/res/Resources$Theme;
    sget v3, Landroid/support/v7/appcompat/R$attr;->actionBarWidgetTheme:I

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 892
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    .line 894
    .local v2, "targetThemeRes":I
    if-eqz v2, :cond_25

    .line 895
    new-instance v3, Landroid/view/ContextThemeWrapper;

    iget-object v4, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mThemedContext:Landroid/content/Context;

    .line 900
    .end local v0    # "currentTheme":Landroid/content/res/Resources$Theme;
    .end local v1    # "outValue":Landroid/util/TypedValue;
    .end local v2    # "targetThemeRes":I
    :cond_22
    :goto_22
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mThemedContext:Landroid/content/Context;

    return-object v3

    .line 897
    .restart local v0    # "currentTheme":Landroid/content/res/Resources$Theme;
    .restart local v1    # "outValue":Landroid/util/TypedValue;
    .restart local v2    # "targetThemeRes":I
    :cond_25
    iget-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    iput-object v3, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mThemedContext:Landroid/content/Context;

    goto :goto_22
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 690
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    if-nez v0, :cond_b

    .line 691
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    .line 692
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 694
    :cond_b
    return-void
.end method

.method public hideForSystem()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 707
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    if-nez v0, :cond_a

    .line 708
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    .line 709
    invoke-direct {p0, v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 711
    :cond_a
    return-void
.end method

.method public isShowing()Z
    .registers 3

    .prologue
    .line 870
    invoke-virtual {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->getHeight()I

    move-result v0

    .line 872
    .local v0, "height":I
    iget-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mNowShowing:Z

    if-eqz v1, :cond_12

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->getHideOffset()I

    move-result v1

    if-ge v1, v0, :cond_12

    :cond_10
    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 267
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/support/v7/internal/view/ActionBarPolicy;->get(Landroid/content/Context;)Landroid/support/v7/internal/view/ActionBarPolicy;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/view/ActionBarPolicy;->hasEmbeddedTabs()Z

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setHasEmbeddedTabs(Z)V

    .line 268
    return-void
.end method

.method public onContentScrollStarted()V
    .registers 2

    .prologue
    .line 930
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    if-eqz v0, :cond_c

    .line 931
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->cancel()V

    .line 932
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    .line 934
    :cond_c
    return-void
.end method

.method public onContentScrollStopped()V
    .registers 1

    .prologue
    .line 938
    return-void
.end method

.method public onWindowVisibilityChanged(I)V
    .registers 2
    .param p1, "visibility"    # I

    .prologue
    .line 328
    iput p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurWindowVisibility:I

    .line 329
    return-void
.end method

.method public setDefaultDisplayHomeAsUpEnabled(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 1357
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDisplayHomeAsUpSet:Z

    if-nez v0, :cond_7

    .line 1358
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 1360
    :cond_7
    return-void
.end method

.method public setDisplayHomeAsUpEnabled(Z)V
    .registers 4
    .param p1, "showHomeAsUp"    # Z

    .prologue
    const/4 v1, 0x4

    .line 383
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setDisplayOptions(II)V

    .line 384
    return-void

    .line 383
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setDisplayOptions(I)V
    .registers 3
    .param p1, "options"    # I

    .prologue
    .line 454
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_7

    .line 455
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDisplayHomeAsUpSet:Z

    .line 457
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0, p1}, Landroid/support/v7/internal/widget/DecorToolbar;->setDisplayOptions(I)V

    .line 458
    return-void
.end method

.method public setDisplayOptions(II)V
    .registers 7
    .param p1, "options"    # I
    .param p2, "mask"    # I

    .prologue
    .line 461
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorToolbar;->getDisplayOptions()I

    move-result v0

    .line 462
    .local v0, "current":I
    and-int/lit8 v1, p2, 0x4

    if-eqz v1, :cond_d

    .line 463
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDisplayHomeAsUpSet:Z

    .line 465
    :cond_d
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    and-int v2, p1, p2

    xor-int/lit8 v3, p2, -0x1

    and-int/2addr v3, v0

    or-int/2addr v2, v3

    invoke-interface {v1, v2}, Landroid/support/v7/internal/widget/DecorToolbar;->setDisplayOptions(I)V

    .line 466
    return-void
.end method

.method public setDisplayShowHomeEnabled(Z)V
    .registers 4
    .param p1, "showHome"    # Z

    .prologue
    const/4 v1, 0x2

    .line 378
    if-eqz p1, :cond_8

    move v0, v1

    :goto_4
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->setDisplayOptions(II)V

    .line 379
    return-void

    .line 378
    :cond_8
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public setElevation(F)V
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 255
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContainerView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 256
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_e

    .line 257
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 259
    :cond_e
    return-void
.end method

.method public setHideOnContentScrollEnabled(Z)V
    .registers 4
    .param p1, "hideOnContentScroll"    # Z

    .prologue
    .line 715
    if-eqz p1, :cond_12

    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->isInOverlayMode()Z

    move-result v0

    if-nez v0, :cond_12

    .line 716
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 719
    :cond_12
    iput-boolean p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHideOnContentScroll:Z

    .line 720
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 721
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 398
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0, p1}, Landroid/support/v7/internal/widget/DecorToolbar;->setHomeButtonEnabled(Z)V

    .line 399
    return-void
.end method

.method public setShowHideAnimationEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 339
    iput-boolean p1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mShowHideAnimationEnabled:Z

    .line 340
    if-nez p1, :cond_d

    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    if-eqz v0, :cond_d

    .line 341
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mCurrentShowAnim:Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/ViewPropertyAnimatorCompatSet;->cancel()V

    .line 343
    :cond_d
    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 446
    iget-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mDecorToolbar:Landroid/support/v7/internal/widget/DecorToolbar;

    invoke-interface {v0, p1}, Landroid/support/v7/internal/widget/DecorToolbar;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 447
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 665
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    if-eqz v0, :cond_a

    .line 666
    iput-boolean v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenByApp:Z

    .line 667
    invoke-direct {p0, v1}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 669
    :cond_a
    return-void
.end method

.method public showForSystem()V
    .registers 2

    .prologue
    .line 682
    iget-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    if-eqz v0, :cond_b

    .line 683
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mHiddenBySystem:Z

    .line 684
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v7/internal/app/WindowDecorActionBar;->updateVisibility(Z)V

    .line 686
    :cond_b
    return-void
.end method

.method public startActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
    .registers 6
    .param p1, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 503
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    if-eqz v1, :cond_b

    .line 504
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    invoke-virtual {v1}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->finish()V

    .line 507
    :cond_b
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 508
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v1}, Landroid/support/v7/internal/widget/ActionBarContextView;->killMode()V

    .line 509
    new-instance v0, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v1}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;-><init>(Landroid/support/v7/internal/app/WindowDecorActionBar;Landroid/content/Context;Landroid/support/v7/view/ActionMode$Callback;)V

    .line 510
    .local v0, "mode":Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;
    invoke-virtual {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->dispatchOnCreate()Z

    move-result v1

    if-eqz v1, :cond_59

    .line 511
    invoke-virtual {v0}, Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;->invalidate()V

    .line 512
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v1, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->initForMode(Landroid/support/v7/view/ActionMode;)V

    .line 513
    invoke-virtual {p0, v3}, Landroid/support/v7/internal/app/WindowDecorActionBar;->animateToMode(Z)V

    .line 514
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v1, :cond_4f

    iget v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextDisplayMode:I

    if-ne v1, v3, :cond_4f

    .line 516
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v1}, Landroid/support/v7/internal/widget/ActionBarContainer;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_4f

    .line 517
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/widget/ActionBarContainer;->setVisibility(I)V

    .line 518
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    if-eqz v1, :cond_4f

    .line 519
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mOverlayLayout:Landroid/support/v7/internal/widget/ActionBarOverlayLayout;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->requestApplyInsets(Landroid/view/View;)V

    .line 523
    :cond_4f
    iget-object v1, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mContextView:Landroid/support/v7/internal/widget/ActionBarContextView;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->sendAccessibilityEvent(I)V

    .line 524
    iput-object v0, p0, Landroid/support/v7/internal/app/WindowDecorActionBar;->mActionMode:Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;

    .line 527
    .end local v0    # "mode":Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;
    :goto_58
    return-object v0

    .restart local v0    # "mode":Landroid/support/v7/internal/app/WindowDecorActionBar$ActionModeImpl;
    :cond_59
    const/4 v0, 0x0

    goto :goto_58
.end method
