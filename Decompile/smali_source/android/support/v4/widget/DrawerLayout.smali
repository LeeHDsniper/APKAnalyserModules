.class public Landroid/support/v4/widget/DrawerLayout;
.super Landroid/view/ViewGroup;
.source "DrawerLayout.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayoutImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;,
        Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;,
        Landroid/support/v4/widget/DrawerLayout$LayoutParams;,
        Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;,
        Landroid/support/v4/widget/DrawerLayout$SavedState;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;,
        Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;,
        Landroid/support/v4/widget/DrawerLayout$DrawerListener;
    }
.end annotation


# static fields
.field private static final CAN_HIDE_DESCENDANTS:Z

.field static final IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

.field private static final LAYOUT_ATTRS:[I


# instance fields
.field private final mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

.field private mChildrenCanceledTouch:Z

.field private mDisallowInterceptRequested:Z

.field private mDrawStatusBarBackground:Z

.field private mDrawerState:I

.field private mFirstLayout:Z

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mLastInsets:Ljava/lang/Object;

.field private final mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

.field private final mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

.field private mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

.field private mLockModeLeft:I

.field private mLockModeRight:I

.field private mMinDrawerMargin:I

.field private final mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

.field private final mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

.field private mScrimColor:I

.field private mScrimOpacity:F

.field private mScrimPaint:Landroid/graphics/Paint;

.field private mShadowLeft:Landroid/graphics/drawable/Drawable;

.field private mShadowRight:Landroid/graphics/drawable/Drawable;

.field private mStatusBarBackground:Landroid/graphics/drawable/Drawable;

.field private mTitleLeft:Ljava/lang/CharSequence;

.field private mTitleRight:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 159
    new-array v3, v1, [I

    const v4, 0x10100b3

    aput v4, v3, v2

    sput-object v3, Landroid/support/v4/widget/DrawerLayout;->LAYOUT_ATTRS:[I

    .line 164
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v3, v4, :cond_21

    :goto_11
    sput-boolean v1, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    .line 314
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 315
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_23

    .line 316
    new-instance v1, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;

    invoke-direct {v1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplApi21;-><init>()V

    sput-object v1, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    .line 320
    :goto_20
    return-void

    .end local v0    # "version":I
    :cond_21
    move v1, v2

    .line 164
    goto :goto_11

    .line 318
    .restart local v0    # "version":I
    :cond_23
    new-instance v1, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;

    invoke-direct {v1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    goto :goto_20
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 326
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 329
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/widget/DrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 330
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v5, 0x3f800000

    const/4 v4, 0x1

    .line 333
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 166
    new-instance v2, Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    invoke-direct {v2, p0}, Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;-><init>(Landroid/support/v4/widget/DrawerLayout;)V

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    .line 171
    const/high16 v2, -0x67000000

    iput v2, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    .line 173
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    .line 181
    iput-boolean v4, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    .line 334
    const/high16 v2, 0x40000

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->setDescendantFocusability(I)V

    .line 335
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 336
    .local v0, "density":F
    const/high16 v2, 0x42800000

    mul-float/2addr v2, v0

    const/high16 v3, 0x3f000000

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/DrawerLayout;->mMinDrawerMargin:I

    .line 337
    const/high16 v2, 0x43c80000

    mul-float v1, v2, v0

    .line 339
    .local v1, "minVel":F
    new-instance v2, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;-><init>(Landroid/support/v4/widget/DrawerLayout;I)V

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    .line 340
    new-instance v2, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;-><init>(Landroid/support/v4/widget/DrawerLayout;I)V

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    .line 342
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-static {p0, v5, v2}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    .line 343
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, v4}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    .line 344
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, v1}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    .line 345
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->setDragger(Landroid/support/v4/widget/ViewDragHelper;)V

    .line 347
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-static {p0, v5, v2}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    .line 348
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    .line 349
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, v1}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    .line 350
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    iget-object v3, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2, v3}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->setDragger(Landroid/support/v4/widget/ViewDragHelper;)V

    .line 353
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->setFocusableInTouchMode(Z)V

    .line 355
    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 358
    new-instance v2, Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;

    invoke-direct {v2, p0}, Landroid/support/v4/widget/DrawerLayout$AccessibilityDelegate;-><init>(Landroid/support/v4/widget/DrawerLayout;)V

    invoke-static {p0, v2}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 359
    const/4 v2, 0x0

    invoke-static {p0, v2}, Landroid/support/v4/view/ViewGroupCompat;->setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V

    .line 360
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_9e

    .line 361
    sget-object v2, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    invoke-interface {v2, p0}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->configureApplyInsets(Landroid/view/View;)V

    .line 362
    sget-object v2, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    invoke-interface {v2, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->getDefaultStatusBarBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    .line 364
    :cond_9e
    return-void
.end method

.method static synthetic access$100()[I
    .registers 1

    .prologue
    .line 86
    sget-object v0, Landroid/support/v4/widget/DrawerLayout;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method static synthetic access$200()Z
    .registers 1

    .prologue
    .line 86
    sget-boolean v0, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    return v0
.end method

.method static synthetic access$300(Landroid/support/v4/widget/DrawerLayout;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/widget/DrawerLayout;

    .prologue
    .line 86
    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Landroid/view/View;)Z
    .registers 2
    .param p0, "x0"    # Landroid/view/View;

    .prologue
    .line 86
    invoke-static {p0}, Landroid/support/v4/widget/DrawerLayout;->includeChildForAccessibility(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method private findVisibleDrawer()Landroid/view/View;
    .registers 5

    .prologue
    .line 1473
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    .line 1474
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_1b

    .line 1475
    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1476
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerVisible(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 1480
    .end local v0    # "child":Landroid/view/View;
    :goto_17
    return-object v0

    .line 1474
    .restart local v0    # "child":Landroid/view/View;
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1480
    .end local v0    # "child":Landroid/view/View;
    :cond_1b
    const/4 v0, 0x0

    goto :goto_17
.end method

.method static gravityToString(I)Ljava/lang/String;
    .registers 3
    .param p0, "gravity"    # I

    .prologue
    .line 783
    and-int/lit8 v0, p0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_8

    .line 784
    const-string v0, "LEFT"

    .line 789
    :goto_7
    return-object v0

    .line 786
    :cond_8
    and-int/lit8 v0, p0, 0x5

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    .line 787
    const-string v0, "RIGHT"

    goto :goto_7

    .line 789
    :cond_10
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method private static hasOpaqueBackground(Landroid/view/View;)Z
    .registers 5
    .param p0, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 1000
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1001
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_f

    .line 1002
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_f

    const/4 v1, 0x1

    .line 1004
    :cond_f
    return v1
.end method

.method private hasPeekingDrawer()Z
    .registers 5

    .prologue
    .line 1434
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    .line 1435
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_1a

    .line 1436
    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1437
    .local v2, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget-boolean v3, v2, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    if-eqz v3, :cond_17

    .line 1438
    const/4 v3, 0x1

    .line 1441
    .end local v2    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :goto_16
    return v3

    .line 1435
    .restart local v2    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1441
    .end local v2    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_1a
    const/4 v3, 0x0

    goto :goto_16
.end method

.method private hasVisibleDrawer()Z
    .registers 2

    .prologue
    .line 1469
    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static includeChildForAccessibility(Landroid/view/View;)Z
    .registers 3
    .param p0, "child"    # Landroid/view/View;

    .prologue
    .line 1581
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private updateChildrenImportantForAccessibility(Landroid/view/View;Z)V
    .registers 7
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "isDrawerOpen"    # Z

    .prologue
    .line 683
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    .line 684
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_23

    .line 685
    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 686
    .local v0, "child":Landroid/view/View;
    if-nez p2, :cond_13

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_17

    :cond_13
    if-eqz p2, :cond_1e

    if-ne v0, p1, :cond_1e

    .line 690
    :cond_17
    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 684
    :goto_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 693
    :cond_1e
    const/4 v3, 0x4

    invoke-static {v0, v3}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    goto :goto_1b

    .line 697
    .end local v0    # "child":Landroid/view/View;
    :cond_23
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1553
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1555
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v0

    .line 1556
    .local v0, "openDrawer":Landroid/view/View;
    if-nez v0, :cond_f

    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 1559
    :cond_f
    const/4 v1, 0x4

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 1570
    :goto_13
    sget-boolean v1, Landroid/support/v4/widget/DrawerLayout;->CAN_HIDE_DESCENDANTS:Z

    if-nez v1, :cond_1c

    .line 1571
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mChildAccessibilityDelegate:Landroid/support/v4/widget/DrawerLayout$ChildAccessibilityDelegate;

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 1573
    :cond_1c
    return-void

    .line 1564
    :cond_1d
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    goto :goto_13
.end method

.method cancelChildViewTouch()V
    .registers 12

    .prologue
    const/4 v5, 0x0

    .line 1485
    iget-boolean v2, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    if-nez v2, :cond_28

    .line 1486
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1487
    .local v0, "now":J
    const/4 v4, 0x3

    const/4 v7, 0x0

    move-wide v2, v0

    move v6, v5

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 1489
    .local v8, "cancelEvent":Landroid/view/MotionEvent;
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v9

    .line 1490
    .local v9, "childCount":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_16
    if-ge v10, v9, :cond_22

    .line 1491
    invoke-virtual {p0, v10}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v8}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1490
    add-int/lit8 v10, v10, 0x1

    goto :goto_16

    .line 1493
    :cond_22
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    .line 1494
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    .line 1496
    .end local v0    # "now":J
    .end local v8    # "cancelEvent":Landroid/view/MotionEvent;
    .end local v9    # "childCount":I
    .end local v10    # "i":I
    :cond_28
    return-void
.end method

.method checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z
    .registers 5
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "checkFor"    # I

    .prologue
    .line 729
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v0

    .line 730
    .local v0, "absGravity":I
    and-int v1, v0, p2

    if-ne v1, p2, :cond_a

    const/4 v1, 0x1

    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1460
    instance-of v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public closeDrawer(Landroid/view/View;)V
    .registers 6
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1334
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_25

    .line 1335
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "View "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a sliding drawer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1338
    :cond_25
    iget-boolean v1, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    if-eqz v1, :cond_39

    .line 1339
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1340
    .local v0, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    .line 1341
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    .line 1350
    .end local v0    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :goto_35
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1351
    return-void

    .line 1343
    :cond_39
    const/4 v1, 0x3

    invoke-virtual {p0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 1344
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_35

    .line 1347
    :cond_4f
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_35
.end method

.method public closeDrawers()V
    .registers 2

    .prologue
    .line 1251
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    .line 1252
    return-void
.end method

.method closeDrawers(Z)V
    .registers 11
    .param p1, "peekingOnly"    # Z

    .prologue
    .line 1255
    const/4 v5, 0x0

    .line 1256
    .local v5, "needsInvalidate":Z
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    .line 1257
    .local v1, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v1, :cond_4c

    .line 1258
    invoke-virtual {p0, v3}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1259
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1261
    .local v4, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_1e

    if-eqz p1, :cond_21

    iget-boolean v6, v4, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    if-nez v6, :cond_21

    .line 1257
    :cond_1e
    :goto_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 1265
    :cond_21
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 1267
    .local v2, "childWidth":I
    const/4 v6, 0x3

    invoke-virtual {p0, v0, v6}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 1268
    iget-object v6, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    neg-int v7, v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v8

    invoke-virtual {v6, v0, v7, v8}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v6

    or-int/2addr v5, v6

    .line 1275
    :goto_38
    const/4 v6, 0x0

    iput-boolean v6, v4, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->isPeeking:Z

    goto :goto_1e

    .line 1271
    :cond_3c
    iget-object v6, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v7

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v8

    invoke-virtual {v6, v0, v7, v8}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v6

    or-int/2addr v5, v6

    goto :goto_38

    .line 1278
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childWidth":I
    .end local v4    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_4c
    iget-object v6, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v6}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    .line 1279
    iget-object v6, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v6}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    .line 1281
    if-eqz v5, :cond_5b

    .line 1282
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1284
    :cond_5b
    return-void
.end method

.method public computeScroll()V
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 985
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v0

    .line 986
    .local v0, "childCount":I
    const/4 v3, 0x0

    .line 987
    .local v3, "scrimOpacity":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_1c

    .line 988
    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v2, v4, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    .line 989
    .local v2, "onscreen":F
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 987
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 991
    .end local v2    # "onscreen":F
    :cond_1c
    iput v3, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    .line 994
    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4, v6}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v4

    iget-object v5, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v5

    or-int/2addr v4, v5

    if-eqz v4, :cond_30

    .line 995
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 997
    :cond_30
    return-void
.end method

.method dispatchOnDrawerClosed(Landroid/view/View;)V
    .registers 6
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 642
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 643
    .local v0, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget-boolean v2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-eqz v2, :cond_2a

    .line 644
    iput-boolean v3, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    .line 645
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v2, :cond_16

    .line 646
    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v2, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerClosed(Landroid/view/View;)V

    .line 649
    :cond_16
    invoke-direct {p0, p1, v3}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    .line 654
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 655
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getRootView()Landroid/view/View;

    move-result-object v1

    .line 656
    .local v1, "rootView":Landroid/view/View;
    if-eqz v1, :cond_2a

    .line 657
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 661
    .end local v1    # "rootView":Landroid/view/View;
    :cond_2a
    return-void
.end method

.method dispatchOnDrawerOpened(Landroid/view/View;)V
    .registers 5
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 664
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 665
    .local v0, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget-boolean v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-nez v1, :cond_27

    .line 666
    iput-boolean v2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    .line 667
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v1, :cond_16

    .line 668
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v1, p1}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerOpened(Landroid/view/View;)V

    .line 671
    :cond_16
    invoke-direct {p0, p1, v2}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    .line 674
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->hasWindowFocus()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 675
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->sendAccessibilityEvent(I)V

    .line 678
    :cond_24
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 680
    :cond_27
    return-void
.end method

.method dispatchOnDrawerSlide(Landroid/view/View;F)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 700
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v0, :cond_9

    .line 701
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerSlide(Landroid/view/View;F)V

    .line 703
    :cond_9
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 34
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .prologue
    .line 1064
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v18

    .line 1065
    .local v18, "height":I
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v17

    .line 1066
    .local v17, "drawingContent":Z
    const/4 v13, 0x0

    .local v13, "clipLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v14

    .line 1068
    .local v14, "clipRight":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v21

    .line 1069
    .local v21, "restoreCount":I
    if-eqz v17, :cond_7b

    .line 1070
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v10

    .line 1071
    .local v10, "childCount":I
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1d
    move/from16 v0, v19

    if-ge v0, v10, :cond_71

    .line 1072
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v25

    .line 1073
    .local v25, "v":Landroid/view/View;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    if-eq v0, v1, :cond_4d

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_4d

    invoke-static/range {v25 .. v25}, Landroid/support/v4/widget/DrawerLayout;->hasOpaqueBackground(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4d

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4d

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getHeight()I

    move-result v2

    move/from16 v0, v18

    if-ge v2, v0, :cond_50

    .line 1071
    :cond_4d
    :goto_4d
    add-int/lit8 v19, v19, 0x1

    goto :goto_1d

    .line 1079
    :cond_50
    const/4 v2, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v2

    if-eqz v2, :cond_66

    .line 1080
    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getRight()I

    move-result v27

    .line 1081
    .local v27, "vright":I
    move/from16 v0, v27

    if-le v0, v13, :cond_4d

    move/from16 v13, v27

    goto :goto_4d

    .line 1083
    .end local v27    # "vright":I
    :cond_66
    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getLeft()I

    move-result v26

    .line 1084
    .local v26, "vleft":I
    move/from16 v0, v26

    if-ge v0, v14, :cond_4d

    move/from16 v14, v26

    goto :goto_4d

    .line 1087
    .end local v25    # "v":Landroid/view/View;
    .end local v26    # "vleft":I
    :cond_71
    const/4 v2, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v2, v14, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 1089
    .end local v10    # "childCount":I
    .end local v19    # "i":I
    :cond_7b
    invoke-super/range {p0 .. p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v22

    .line 1090
    .local v22, "result":Z
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1092
    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_c8

    if-eqz v17, :cond_c8

    .line 1093
    move-object/from16 v0, p0

    iget v2, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    const/high16 v3, -0x1000000

    and-int/2addr v2, v3

    ushr-int/lit8 v9, v2, 0x18

    .line 1094
    .local v9, "baseAlpha":I
    int-to-float v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    mul-float/2addr v2, v3

    float-to-int v0, v2

    move/from16 v20, v0

    .line 1095
    .local v20, "imag":I
    shl-int/lit8 v2, v20, 0x18

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    or-int v15, v2, v3

    .line 1096
    .local v15, "color":I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v15}, Landroid/graphics/Paint;->setColor(I)V

    .line 1098
    int-to-float v3, v13

    const/4 v4, 0x0

    int-to-float v5, v14

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getHeight()I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Landroid/support/v4/widget/DrawerLayout;->mScrimPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1121
    .end local v9    # "baseAlpha":I
    .end local v15    # "color":I
    .end local v20    # "imag":I
    :cond_c7
    :goto_c7
    return v22

    .line 1099
    :cond_c8
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_123

    const/4 v2, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v2

    if-eqz v2, :cond_123

    .line 1100
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v23

    .line 1101
    .local v23, "shadowWidth":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getRight()I

    move-result v12

    .line 1102
    .local v12, "childRight":I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2}, Landroid/support/v4/widget/ViewDragHelper;->getEdgeSize()I

    move-result v16

    .line 1103
    .local v16, "drawerPeekDistance":I
    const/4 v2, 0x0

    int-to-float v3, v12

    move/from16 v0, v16

    int-to-float v4, v0

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 1105
    .local v8, "alpha":F
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v3

    add-int v4, v12, v23

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v5

    invoke-virtual {v2, v12, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1107
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    const/high16 v3, 0x437f0000

    mul-float/2addr v3, v8

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1108
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowLeft:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_c7

    .line 1109
    .end local v8    # "alpha":F
    .end local v12    # "childRight":I
    .end local v16    # "drawerPeekDistance":I
    .end local v23    # "shadowWidth":I
    :cond_123
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_c7

    const/4 v2, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v2

    if-eqz v2, :cond_c7

    .line 1110
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v23

    .line 1111
    .restart local v23    # "shadowWidth":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v11

    .line 1112
    .local v11, "childLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    sub-int v24, v2, v11

    .line 1113
    .local v24, "showing":I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v2}, Landroid/support/v4/widget/ViewDragHelper;->getEdgeSize()I

    move-result v16

    .line 1114
    .restart local v16    # "drawerPeekDistance":I
    const/4 v2, 0x0

    move/from16 v0, v24

    int-to-float v3, v0

    move/from16 v0, v16

    int-to-float v4, v0

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 1116
    .restart local v8    # "alpha":F
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    sub-int v3, v11, v23

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v5

    invoke-virtual {v2, v3, v4, v11, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1118
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    const/high16 v3, 0x437f0000

    mul-float/2addr v3, v8

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1119
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/support/v4/widget/DrawerLayout;->mShadowRight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_c7
.end method

.method findDrawerWithGravity(I)Landroid/view/View;
    .registers 8
    .param p1, "gravity"    # I

    .prologue
    .line 763
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v5

    invoke-static {p1, v5}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v5

    and-int/lit8 v0, v5, 0x7

    .line 765
    .local v0, "absHorizGravity":I
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v3

    .line 766
    .local v3, "childCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_f
    if-ge v4, v3, :cond_21

    .line 767
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 768
    .local v1, "child":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v2

    .line 769
    .local v2, "childAbsGravity":I
    and-int/lit8 v5, v2, 0x7

    if-ne v5, v0, :cond_1e

    .line 773
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childAbsGravity":I
    :goto_1d
    return-object v1

    .line 766
    .restart local v1    # "child":Landroid/view/View;
    .restart local v2    # "childAbsGravity":I
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    .line 773
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childAbsGravity":I
    :cond_21
    const/4 v1, 0x0

    goto :goto_1d
.end method

.method findOpenDrawer()Landroid/view/View;
    .registers 5

    .prologue
    .line 734
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v1

    .line 735
    .local v1, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_19

    .line 736
    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 737
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget-boolean v3, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    if-eqz v3, :cond_16

    .line 741
    .end local v0    # "child":Landroid/view/View;
    :goto_15
    return-object v0

    .line 735
    .restart local v0    # "child":Landroid/view/View;
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 741
    .end local v0    # "child":Landroid/view/View;
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 1446
    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1465
    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1451
    instance-of v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    if-eqz v0, :cond_c

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    check-cast p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/support/v4/widget/DrawerLayout$LayoutParams;)V

    :goto_b
    return-object v0

    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_18

    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_b

    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_18
    new-instance v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public getDrawerLockMode(Landroid/view/View;)I
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 557
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v0

    .line 558
    .local v0, "absGravity":I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    .line 559
    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    .line 563
    :goto_9
    return v1

    .line 560
    :cond_a
    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    .line 561
    iget v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    goto :goto_9

    .line 563
    :cond_10
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public getDrawerTitle(I)Ljava/lang/CharSequence;
    .registers 4
    .param p1, "edgeGravity"    # I

    .prologue
    .line 596
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {p1, v1}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    .line 598
    .local v0, "absGravity":I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    .line 599
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleLeft:Ljava/lang/CharSequence;

    .line 603
    :goto_d
    return-object v1

    .line 600
    :cond_e
    const/4 v1, 0x5

    if-ne v0, v1, :cond_14

    .line 601
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mTitleRight:Ljava/lang/CharSequence;

    goto :goto_d

    .line 603
    :cond_14
    const/4 v1, 0x0

    goto :goto_d
.end method

.method getDrawerViewAbsoluteGravity(Landroid/view/View;)I
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 724
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 725
    .local v0, "gravity":I
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {v0, v1}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    return v1
.end method

.method getDrawerViewOffset(Landroid/view/View;)F
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 716
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    return v0
.end method

.method public getStatusBarBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 1024
    iget-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method isContentView(Landroid/view/View;)Z
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1125
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method isDrawerView(Landroid/view/View;)Z
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1129
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v1, v2, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    .line 1130
    .local v1, "gravity":I
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v2

    invoke-static {v1, v2}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    .line 1132
    .local v0, "absGravity":I
    and-int/lit8 v2, v0, 0x7

    if-eqz v2, :cond_16

    const/4 v2, 0x1

    :goto_15
    return v2

    :cond_16
    const/4 v2, 0x0

    goto :goto_15
.end method

.method public isDrawerVisible(Landroid/view/View;)Z
    .registers 5
    .param p1, "drawer"    # Landroid/view/View;

    .prologue
    .line 1411
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 1412
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a drawer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1414
    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_34

    const/4 v0, 0x1

    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 800
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 801
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    .line 802
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 794
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 795
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    .line 796
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    .line 1052
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 1053
    iget-boolean v1, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawStatusBarBackground:Z

    if-eqz v1, :cond_24

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_24

    .line 1054
    sget-object v1, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    iget-object v2, p0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    invoke-interface {v1, v2}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->getTopInset(Ljava/lang/Object;)I

    move-result v0

    .line 1055
    .local v0, "inset":I
    if-lez v0, :cond_24

    .line 1056
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1057
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1060
    .end local v0    # "inset":I
    :cond_24
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 13
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1137
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 1140
    .local v0, "action":I
    iget-object v8, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v8, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    iget-object v9, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v9, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v9

    or-int v2, v8, v9

    .line 1143
    .local v2, "interceptForDrag":Z
    const/4 v3, 0x0

    .line 1145
    .local v3, "interceptForTap":Z
    packed-switch v0, :pswitch_data_6e

    .line 1179
    :cond_18
    :goto_18
    if-nez v2, :cond_26

    if-nez v3, :cond_26

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->hasPeekingDrawer()Z

    move-result v8

    if-nez v8, :cond_26

    iget-boolean v8, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    if-eqz v8, :cond_27

    :cond_26
    move v6, v7

    :cond_27
    return v6

    .line 1147
    :pswitch_28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 1148
    .local v4, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 1149
    .local v5, "y":F
    iput v4, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    .line 1150
    iput v5, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    .line 1151
    iget v8, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimOpacity:F

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-lez v8, :cond_4c

    .line 1152
    iget-object v8, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    float-to-int v9, v4

    float-to-int v10, v5

    invoke-virtual {v8, v9, v10}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v1

    .line 1153
    .local v1, "child":Landroid/view/View;
    if-eqz v1, :cond_4c

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_4c

    .line 1154
    const/4 v3, 0x1

    .line 1157
    .end local v1    # "child":Landroid/view/View;
    :cond_4c
    iput-boolean v6, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    .line 1158
    iput-boolean v6, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_18

    .line 1164
    .end local v4    # "x":F
    .end local v5    # "y":F
    :pswitch_51
    iget-object v8, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->checkTouchSlop(I)Z

    move-result v8

    if-eqz v8, :cond_18

    .line 1165
    iget-object v8, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v8}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    .line 1166
    iget-object v8, p0, Landroid/support/v4/widget/DrawerLayout;->mRightCallback:Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;

    invoke-virtual {v8}, Landroid/support/v4/widget/DrawerLayout$ViewDragCallback;->removeCallbacks()V

    goto :goto_18

    .line 1173
    :pswitch_65
    invoke-virtual {p0, v7}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    .line 1174
    iput-boolean v6, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    .line 1175
    iput-boolean v6, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_18

    .line 1145
    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_28
        :pswitch_65
        :pswitch_51
        :pswitch_65
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1500
    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->hasVisibleDrawer()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1501
    invoke-static {p2}, Landroid/support/v4/view/KeyEventCompat;->startTracking(Landroid/view/KeyEvent;)V

    .line 1502
    const/4 v0, 0x1

    .line 1504
    :goto_d
    return v0

    :cond_e
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_d
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1509
    const/4 v1, 0x4

    if-ne p1, v1, :cond_18

    .line 1510
    invoke-direct {p0}, Landroid/support/v4/widget/DrawerLayout;->findVisibleDrawer()Landroid/view/View;

    move-result-object v0

    .line 1511
    .local v0, "visibleDrawer":Landroid/view/View;
    if-eqz v0, :cond_12

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->getDrawerLockMode(Landroid/view/View;)I

    move-result v1

    if-nez v1, :cond_12

    .line 1512
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    .line 1514
    :cond_12
    if-eqz v0, :cond_16

    const/4 v1, 0x1

    .line 1516
    .end local v0    # "visibleDrawer":Landroid/view/View;
    :goto_15
    return v1

    .line 1514
    .restart local v0    # "visibleDrawer":Landroid/view/View;
    :cond_16
    const/4 v1, 0x0

    goto :goto_15

    .line 1516
    .end local v0    # "visibleDrawer":Landroid/view/View;
    :cond_18
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_15
.end method

.method protected onLayout(ZIIII)V
    .registers 29
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 894
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    .line 895
    sub-int v17, p4, p2

    .line 896
    .local v17, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v6

    .line 897
    .local v6, "childCount":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_f
    if-ge v12, v6, :cond_149

    .line 898
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 900
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v18

    const/16 v19, 0x8

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_26

    .line 897
    :cond_23
    :goto_23
    add-int/lit8 v12, v12, 0x1

    goto :goto_f

    .line 904
    :cond_26
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 906
    .local v13, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v18

    if-eqz v18, :cond_5c

    .line 907
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    move/from16 v18, v0

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v19, v0

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    move/from16 v20, v0

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v21

    add-int v20, v20, v21

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v21, v0

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v22

    add-int v21, v21, v22

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v5, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    goto :goto_23

    .line 911
    :cond_5c
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    .line 912
    .local v10, "childWidth":I
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    .line 916
    .local v7, "childHeight":I
    const/16 v18, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v5, v1}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v18

    if-eqz v18, :cond_d5

    .line 917
    neg-int v0, v10

    move/from16 v18, v0

    int-to-float v0, v10

    move/from16 v19, v0

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    move/from16 v20, v0

    mul-float v19, v19, v20

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    add-int v8, v18, v19

    .line 918
    .local v8, "childLeft":I
    add-int v18, v10, v8

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    int-to-float v0, v10

    move/from16 v19, v0

    div-float v14, v18, v19

    .line 924
    .local v14, "newOffset":F
    :goto_8f
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    move/from16 v18, v0

    cmpl-float v18, v14, v18

    if-eqz v18, :cond_f2

    const/4 v4, 0x1

    .line 926
    .local v4, "changeOffset":Z
    :goto_98
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    move/from16 v18, v0

    and-int/lit8 v16, v18, 0x70

    .line 928
    .local v16, "vgrav":I
    sparse-switch v16, :sswitch_data_15a

    .line 931
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v18, v0

    add-int v19, v8, v10

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v20, v0

    add-int v20, v20, v7

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v5, v8, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 962
    :goto_b6
    if-eqz v4, :cond_bd

    .line 963
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v14}, Landroid/support/v4/widget/DrawerLayout;->setDrawerViewOffset(Landroid/view/View;F)V

    .line 966
    :cond_bd
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    move/from16 v18, v0

    const/16 v19, 0x0

    cmpl-float v18, v18, v19

    if-lez v18, :cond_147

    const/4 v15, 0x0

    .line 967
    .local v15, "newVisibility":I
    :goto_c8
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v15, :cond_23

    .line 968
    invoke-virtual {v5, v15}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_23

    .line 920
    .end local v4    # "changeOffset":Z
    .end local v8    # "childLeft":I
    .end local v14    # "newOffset":F
    .end local v15    # "newVisibility":I
    .end local v16    # "vgrav":I
    :cond_d5
    int-to-float v0, v10

    move/from16 v18, v0

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    sub-int v8, v17, v18

    .line 921
    .restart local v8    # "childLeft":I
    sub-int v18, v17, v8

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    int-to-float v0, v10

    move/from16 v19, v0

    div-float v14, v18, v19

    .restart local v14    # "newOffset":F
    goto :goto_8f

    .line 924
    :cond_f2
    const/4 v4, 0x0

    goto :goto_98

    .line 937
    .restart local v4    # "changeOffset":Z
    .restart local v16    # "vgrav":I
    :sswitch_f4
    sub-int v11, p5, p3

    .line 938
    .local v11, "height":I
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v18, v0

    sub-int v18, v11, v18

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v19

    sub-int v18, v18, v19

    add-int v19, v8, v10

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v20, v0

    sub-int v20, v11, v20

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v5, v8, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_b6

    .line 946
    .end local v11    # "height":I
    :sswitch_114
    sub-int v11, p5, p3

    .line 947
    .restart local v11    # "height":I
    sub-int v18, v11, v7

    div-int/lit8 v9, v18, 0x2

    .line 951
    .local v9, "childTop":I
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_130

    .line 952
    iget v9, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    .line 956
    :cond_124
    :goto_124
    add-int v18, v8, v10

    add-int v19, v9, v7

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v8, v9, v0, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_b6

    .line 953
    :cond_130
    add-int v18, v9, v7

    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v19, v0

    sub-int v19, v11, v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_124

    .line 954
    iget v0, v13, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v18, v0

    sub-int v18, v11, v18

    sub-int v9, v18, v7

    goto :goto_124

    .line 966
    .end local v9    # "childTop":I
    .end local v11    # "height":I
    :cond_147
    const/4 v15, 0x4

    goto :goto_c8

    .line 972
    .end local v4    # "changeOffset":Z
    .end local v5    # "child":Landroid/view/View;
    .end local v7    # "childHeight":I
    .end local v8    # "childLeft":I
    .end local v10    # "childWidth":I
    .end local v13    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    .end local v14    # "newOffset":F
    .end local v16    # "vgrav":I
    :cond_149
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    .line 973
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    .line 974
    return-void

    .line 928
    :sswitch_data_15a
    .sparse-switch
        0x10 -> :sswitch_114
        0x50 -> :sswitch_f4
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .registers 26
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 806
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    .line 807
    .local v18, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 808
    .local v13, "heightMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v19

    .line 809
    .local v19, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v14

    .line 811
    .local v14, "heightSize":I
    const/high16 v20, 0x40000000

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_1e

    const/high16 v20, 0x40000000

    move/from16 v0, v20

    if-eq v13, v0, :cond_36

    .line 812
    :cond_1e
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->isInEditMode()Z

    move-result v20

    if-eqz v20, :cond_7b

    .line 817
    const/high16 v20, -0x80000000

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_6d

    .line 818
    const/high16 v18, 0x40000000

    .line 823
    :cond_2e
    :goto_2e
    const/high16 v20, -0x80000000

    move/from16 v0, v20

    if-ne v13, v0, :cond_74

    .line 824
    const/high16 v13, 0x40000000

    .line 836
    :cond_36
    :goto_36
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v14}, Landroid/support/v4/widget/DrawerLayout;->setMeasuredDimension(II)V

    .line 838
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    move-object/from16 v20, v0

    if-eqz v20, :cond_83

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v20

    if-eqz v20, :cond_83

    const/4 v3, 0x1

    .line 839
    .local v3, "applyInsets":Z
    :goto_4c
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v16

    .line 842
    .local v16, "layoutDirection":I
    const/4 v12, 0x0

    .line 843
    .local v12, "foundDrawers":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/DrawerLayout;->getChildCount()I

    move-result v6

    .line 844
    .local v6, "childCount":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_56
    if-ge v15, v6, :cond_1bf

    .line 845
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Landroid/support/v4/widget/DrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 847
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v20

    const/16 v21, 0x8

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_85

    .line 844
    :goto_6a
    add-int/lit8 v15, v15, 0x1

    goto :goto_56

    .line 819
    .end local v3    # "applyInsets":Z
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "childCount":I
    .end local v12    # "foundDrawers":I
    .end local v15    # "i":I
    .end local v16    # "layoutDirection":I
    :cond_6d
    if-nez v18, :cond_2e

    .line 820
    const/high16 v18, 0x40000000

    .line 821
    const/16 v19, 0x12c

    goto :goto_2e

    .line 826
    :cond_74
    if-nez v13, :cond_36

    .line 827
    const/high16 v13, 0x40000000

    .line 828
    const/16 v14, 0x12c

    goto :goto_36

    .line 831
    :cond_7b
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "DrawerLayout must be measured with MeasureSpec.EXACTLY."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 838
    :cond_83
    const/4 v3, 0x0

    goto :goto_4c

    .line 851
    .restart local v3    # "applyInsets":Z
    .restart local v5    # "child":Landroid/view/View;
    .restart local v6    # "childCount":I
    .restart local v12    # "foundDrawers":I
    .restart local v15    # "i":I
    .restart local v16    # "layoutDirection":I
    :cond_85
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    check-cast v17, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 853
    .local v17, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    if-eqz v3, :cond_b0

    .line 854
    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    move/from16 v20, v0

    move/from16 v0, v20

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v4

    .line 855
    .local v4, "cgrav":I
    invoke-static {v5}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v20

    if-eqz v20, :cond_e8

    .line 856
    sget-object v20, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v5, v1, v4}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->dispatchChildInsets(Landroid/view/View;Ljava/lang/Object;I)V

    .line 862
    .end local v4    # "cgrav":I
    :cond_b0
    :goto_b0
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v20

    if-eqz v20, :cond_fa

    .line 864
    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    move/from16 v20, v0

    sub-int v20, v19, v20

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    move/from16 v21, v0

    sub-int v20, v20, v21

    const/high16 v21, 0x40000000

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 866
    .local v9, "contentWidthSpec":I
    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v20, v0

    sub-int v20, v14, v20

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v21, v0

    sub-int v20, v20, v21

    const/high16 v21, 0x40000000

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 868
    .local v8, "contentHeightSpec":I
    invoke-virtual {v5, v9, v8}, Landroid/view/View;->measure(II)V

    goto :goto_6a

    .line 858
    .end local v8    # "contentHeightSpec":I
    .end local v9    # "contentWidthSpec":I
    .restart local v4    # "cgrav":I
    :cond_e8
    sget-object v20, Landroid/support/v4/widget/DrawerLayout;->IMPL:Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2, v4}, Landroid/support/v4/widget/DrawerLayout$DrawerLayoutCompatImpl;->applyMarginInsets(Landroid/view/ViewGroup$MarginLayoutParams;Ljava/lang/Object;I)V

    goto :goto_b0

    .line 869
    .end local v4    # "cgrav":I
    :cond_fa
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v20

    if-eqz v20, :cond_18c

    .line 870
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/support/v4/widget/DrawerLayout;->getDrawerViewAbsoluteGravity(Landroid/view/View;)I

    move-result v20

    and-int/lit8 v7, v20, 0x7

    .line 872
    .local v7, "childGravity":I
    and-int v20, v12, v7

    if-eqz v20, :cond_143

    .line 873
    new-instance v20, Ljava/lang/IllegalStateException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Child drawer has absolute gravity "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-static {v7}, Landroid/support/v4/widget/DrawerLayout;->gravityToString(I)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " but this "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "DrawerLayout"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " already has a "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "drawer view along that edge"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 877
    :cond_143
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout;->mMinDrawerMargin:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    move/from16 v21, v0

    add-int v20, v20, v21

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    move/from16 v21, v0

    add-int v20, v20, v21

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    move/from16 v21, v0

    move/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildMeasureSpec(III)I

    move-result v11

    .line 880
    .local v11, "drawerWidthSpec":I
    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->bottomMargin:I

    move/from16 v21, v0

    add-int v20, v20, v21

    move-object/from16 v0, v17

    iget v0, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->height:I

    move/from16 v21, v0

    move/from16 v0, p2

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Landroid/support/v4/widget/DrawerLayout;->getChildMeasureSpec(III)I

    move-result v10

    .line 883
    .local v10, "drawerHeightSpec":I
    invoke-virtual {v5, v11, v10}, Landroid/view/View;->measure(II)V

    goto/16 :goto_6a

    .line 885
    .end local v7    # "childGravity":I
    .end local v10    # "drawerHeightSpec":I
    .end local v11    # "drawerWidthSpec":I
    :cond_18c
    new-instance v20, Ljava/lang/IllegalStateException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Child "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " at index "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " does not have a valid layout_gravity - must be Gravity.LEFT, "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "Gravity.RIGHT or Gravity.NO_GRAVITY"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 890
    .end local v5    # "child":Landroid/view/View;
    .end local v17    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_1bf
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1521
    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$SavedState;

    .line 1522
    .local v0, "ss":Landroid/support/v4/widget/DrawerLayout$SavedState;
    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-super {p0, v2}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1524
    iget v2, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    if-eqz v2, :cond_19

    .line 1525
    iget v2, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v1

    .line 1526
    .local v1, "toOpen":Landroid/view/View;
    if-eqz v1, :cond_19

    .line 1527
    invoke-virtual {p0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    .line 1531
    .end local v1    # "toOpen":Landroid/view/View;
    :cond_19
    iget v2, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeLeft:I

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    .line 1532
    iget v2, v0, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeRight:I

    const/4 v3, 0x5

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    .line 1533
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 1537
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 1538
    .local v2, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/support/v4/widget/DrawerLayout$SavedState;

    invoke-direct {v1, v2}, Landroid/support/v4/widget/DrawerLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1540
    .local v1, "ss":Landroid/support/v4/widget/DrawerLayout$SavedState;
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v0

    .line 1541
    .local v0, "openDrawer":Landroid/view/View;
    if-eqz v0, :cond_19

    .line 1542
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    iget v3, v3, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->gravity:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->openDrawerGravity:I

    .line 1545
    :cond_19
    iget v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeLeft:I

    .line 1546
    iget v3, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    iput v3, v1, Landroid/support/v4/widget/DrawerLayout$SavedState;->lockModeRight:I

    .line 1548
    return-object v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 15
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1184
    iget-object v10, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v10, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    .line 1185
    iget-object v10, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v10, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    .line 1187
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1188
    .local v0, "action":I
    const/4 v7, 0x1

    .line 1190
    .local v7, "wantTouchEvents":Z
    and-int/lit16 v10, v0, 0xff

    packed-switch v10, :pswitch_data_7e

    .line 1231
    :goto_14
    :pswitch_14
    return v7

    .line 1192
    :pswitch_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    .line 1193
    .local v8, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    .line 1194
    .local v9, "y":F
    iput v8, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    .line 1195
    iput v9, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    .line 1196
    const/4 v10, 0x0

    iput-boolean v10, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    .line 1197
    const/4 v10, 0x0

    iput-boolean v10, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_14

    .line 1202
    .end local v8    # "x":F
    .end local v9    # "y":F
    :pswitch_28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    .line 1203
    .restart local v8    # "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    .line 1204
    .restart local v9    # "y":F
    const/4 v4, 0x1

    .line 1205
    .local v4, "peekingOnly":Z
    iget-object v10, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    float-to-int v11, v8

    float-to-int v12, v9

    invoke-virtual {v10, v11, v12}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v6

    .line 1206
    .local v6, "touchedView":Landroid/view/View;
    if-eqz v6, :cond_69

    invoke-virtual {p0, v6}, Landroid/support/v4/widget/DrawerLayout;->isContentView(Landroid/view/View;)Z

    move-result v10

    if-eqz v10, :cond_69

    .line 1207
    iget v10, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionX:F

    sub-float v1, v8, v10

    .line 1208
    .local v1, "dx":F
    iget v10, p0, Landroid/support/v4/widget/DrawerLayout;->mInitialMotionY:F

    sub-float v2, v9, v10

    .line 1209
    .local v2, "dy":F
    iget-object v10, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v10}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v5

    .line 1210
    .local v5, "slop":I
    mul-float v10, v1, v1

    mul-float v11, v2, v2

    add-float/2addr v10, v11

    mul-int v11, v5, v5

    int-to-float v11, v11

    cmpg-float v10, v10, v11

    if-gez v10, :cond_69

    .line 1212
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->findOpenDrawer()Landroid/view/View;

    move-result-object v3

    .line 1213
    .local v3, "openDrawer":Landroid/view/View;
    if-eqz v3, :cond_69

    .line 1214
    invoke-virtual {p0, v3}, Landroid/support/v4/widget/DrawerLayout;->getDrawerLockMode(Landroid/view/View;)I

    move-result v10

    const/4 v11, 0x2

    if-ne v10, v11, :cond_70

    const/4 v4, 0x1

    .line 1218
    .end local v1    # "dx":F
    .end local v2    # "dy":F
    .end local v3    # "openDrawer":Landroid/view/View;
    .end local v5    # "slop":I
    :cond_69
    :goto_69
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    .line 1219
    const/4 v10, 0x0

    iput-boolean v10, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    goto :goto_14

    .line 1214
    .restart local v1    # "dx":F
    .restart local v2    # "dy":F
    .restart local v3    # "openDrawer":Landroid/view/View;
    .restart local v5    # "slop":I
    :cond_70
    const/4 v4, 0x0

    goto :goto_69

    .line 1224
    .end local v1    # "dx":F
    .end local v2    # "dy":F
    .end local v3    # "openDrawer":Landroid/view/View;
    .end local v4    # "peekingOnly":Z
    .end local v5    # "slop":I
    .end local v6    # "touchedView":Landroid/view/View;
    .end local v8    # "x":F
    .end local v9    # "y":F
    :pswitch_72
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    .line 1225
    const/4 v10, 0x0

    iput-boolean v10, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    .line 1226
    const/4 v10, 0x0

    iput-boolean v10, p0, Landroid/support/v4/widget/DrawerLayout;->mChildrenCanceledTouch:Z

    goto :goto_14

    .line 1190
    nop

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_28
        :pswitch_14
        :pswitch_72
    .end packed-switch
.end method

.method public openDrawer(Landroid/view/View;)V
    .registers 6
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    .line 1292
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerView(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_26

    .line 1293
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "View "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a sliding drawer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1296
    :cond_26
    iget-boolean v1, p0, Landroid/support/v4/widget/DrawerLayout;->mFirstLayout:Z

    if-eqz v1, :cond_3d

    .line 1297
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 1298
    .local v0, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    const/high16 v1, 0x3f800000

    iput v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    .line 1299
    iput-boolean v2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->knownOpen:Z

    .line 1301
    invoke-direct {p0, p1, v2}, Landroid/support/v4/widget/DrawerLayout;->updateChildrenImportantForAccessibility(Landroid/view/View;Z)V

    .line 1310
    .end local v0    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :goto_39
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1311
    return-void

    .line 1303
    :cond_3d
    const/4 v1, 0x3

    invoke-virtual {p0, p1, v1}, Landroid/support/v4/widget/DrawerLayout;->checkDrawerViewAbsoluteGravity(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 1304
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_39

    .line 1306
    :cond_4f
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_39
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 3
    .param p1, "disallowIntercept"    # Z

    .prologue
    .line 1239
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 1241
    iput-boolean p1, p0, Landroid/support/v4/widget/DrawerLayout;->mDisallowInterceptRequested:Z

    .line 1242
    if-eqz p1, :cond_b

    .line 1243
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers(Z)V

    .line 1245
    :cond_b
    return-void
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 978
    iget-boolean v0, p0, Landroid/support/v4/widget/DrawerLayout;->mInLayout:Z

    if-nez v0, :cond_7

    .line 979
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 981
    :cond_7
    return-void
.end method

.method public setChildInsets(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "insets"    # Ljava/lang/Object;
    .param p2, "draw"    # Z

    .prologue
    .line 372
    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLastInsets:Ljava/lang/Object;

    .line 373
    iput-boolean p2, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawStatusBarBackground:Z

    .line 374
    if-nez p2, :cond_14

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_d
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->setWillNotDraw(Z)V

    .line 375
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->requestLayout()V

    .line 376
    return-void

    .line 374
    :cond_14
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setDrawerListener(Landroid/support/v4/widget/DrawerLayout$DrawerListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    .prologue
    .line 432
    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    .line 433
    return-void
.end method

.method public setDrawerLockMode(I)V
    .registers 3
    .param p1, "lockMode"    # I

    .prologue
    .line 449
    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    .line 450
    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/widget/DrawerLayout;->setDrawerLockMode(II)V

    .line 451
    return-void
.end method

.method public setDrawerLockMode(II)V
    .registers 9
    .param p1, "lockMode"    # I
    .param p2, "edgeGravity"    # I

    .prologue
    const/4 v5, 0x3

    .line 473
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v4

    invoke-static {p2, v4}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v0

    .line 475
    .local v0, "absGravity":I
    if-ne v0, v5, :cond_1a

    .line 476
    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeLeft:I

    .line 480
    :cond_d
    :goto_d
    if-eqz p1, :cond_16

    .line 482
    if-ne v0, v5, :cond_20

    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    .line 483
    .local v1, "helper":Landroid/support/v4/widget/ViewDragHelper;
    :goto_13
    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    .line 485
    .end local v1    # "helper":Landroid/support/v4/widget/ViewDragHelper;
    :cond_16
    packed-switch p1, :pswitch_data_38

    .line 500
    :cond_19
    :goto_19
    return-void

    .line 477
    :cond_1a
    const/4 v4, 0x5

    if-ne v0, v4, :cond_d

    .line 478
    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mLockModeRight:I

    goto :goto_d

    .line 482
    :cond_20
    iget-object v1, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    goto :goto_13

    .line 487
    :pswitch_23
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v3

    .line 488
    .local v3, "toOpen":Landroid/view/View;
    if-eqz v3, :cond_19

    .line 489
    invoke-virtual {p0, v3}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(Landroid/view/View;)V

    goto :goto_19

    .line 493
    .end local v3    # "toOpen":Landroid/view/View;
    :pswitch_2d
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/DrawerLayout;->findDrawerWithGravity(I)Landroid/view/View;

    move-result-object v2

    .line 494
    .local v2, "toClose":Landroid/view/View;
    if-eqz v2, :cond_19

    .line 495
    invoke-virtual {p0, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    goto :goto_19

    .line 485
    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_23
    .end packed-switch
.end method

.method setDrawerViewOffset(Landroid/view/View;F)V
    .registers 5
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 706
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 707
    .local v0, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget v1, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    cmpl-float v1, p2, v1

    if-nez v1, :cond_d

    .line 713
    :goto_c
    return-void

    .line 711
    :cond_d
    iput p2, v0, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    .line 712
    invoke-virtual {p0, p1, p2}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerSlide(Landroid/view/View;F)V

    goto :goto_c
.end method

.method public setScrimColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 421
    iput p1, p0, Landroid/support/v4/widget/DrawerLayout;->mScrimColor:I

    .line 422
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 423
    return-void
.end method

.method public setStatusBarBackground(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 1034
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_a
    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    .line 1035
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1036
    return-void

    .line 1034
    :cond_10
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "bg"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1014
    iput-object p1, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    .line 1015
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1016
    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 1046
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/widget/DrawerLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    .line 1047
    invoke-virtual {p0}, Landroid/support/v4/widget/DrawerLayout;->invalidate()V

    .line 1048
    return-void
.end method

.method updateDrawerState(IILandroid/view/View;)V
    .registers 11
    .param p1, "forGravity"    # I
    .param p2, "activeState"    # I
    .param p3, "activeDrawer"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 611
    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mLeftDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v0

    .line 612
    .local v0, "leftState":I
    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mRightDragger:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v2

    .line 615
    .local v2, "rightState":I
    if-eq v0, v5, :cond_12

    if-ne v2, v5, :cond_37

    .line 616
    :cond_12
    const/4 v3, 0x1

    .line 623
    .local v3, "state":I
    :goto_13
    if-eqz p3, :cond_27

    if-nez p2, :cond_27

    .line 624
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .line 625
    .local v1, "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    iget v4, v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-nez v4, :cond_3f

    .line 626
    invoke-virtual {p0, p3}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerClosed(Landroid/view/View;)V

    .line 632
    .end local v1    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_27
    :goto_27
    iget v4, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerState:I

    if-eq v3, v4, :cond_36

    .line 633
    iput v3, p0, Landroid/support/v4/widget/DrawerLayout;->mDrawerState:I

    .line 635
    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    if-eqz v4, :cond_36

    .line 636
    iget-object v4, p0, Landroid/support/v4/widget/DrawerLayout;->mListener:Landroid/support/v4/widget/DrawerLayout$DrawerListener;

    invoke-interface {v4, v3}, Landroid/support/v4/widget/DrawerLayout$DrawerListener;->onDrawerStateChanged(I)V

    .line 639
    :cond_36
    return-void

    .line 617
    .end local v3    # "state":I
    :cond_37
    if-eq v0, v6, :cond_3b

    if-ne v2, v6, :cond_3d

    .line 618
    :cond_3b
    const/4 v3, 0x2

    .restart local v3    # "state":I
    goto :goto_13

    .line 620
    .end local v3    # "state":I
    :cond_3d
    const/4 v3, 0x0

    .restart local v3    # "state":I
    goto :goto_13

    .line 627
    .restart local v1    # "lp":Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    :cond_3f
    iget v4, v1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->onScreen:F

    const/high16 v5, 0x3f800000

    cmpl-float v4, v4, v5

    if-nez v4, :cond_27

    .line 628
    invoke-virtual {p0, p3}, Landroid/support/v4/widget/DrawerLayout;->dispatchOnDrawerOpened(Landroid/view/View;)V

    goto :goto_27
.end method
