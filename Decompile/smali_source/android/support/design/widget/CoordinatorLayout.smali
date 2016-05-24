.class public Landroid/support/design/widget/CoordinatorLayout;
.super Landroid/view/ViewGroup;
.source "CoordinatorLayout.java"

# interfaces
.implements Landroid/support/v4/view/NestedScrollingParent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/CoordinatorLayout$SavedState;,
        Landroid/support/design/widget/CoordinatorLayout$LayoutParams;,
        Landroid/support/design/widget/CoordinatorLayout$Behavior;,
        Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;,
        Landroid/support/design/widget/CoordinatorLayout$ViewElevationComparator;,
        Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;
    }
.end annotation


# static fields
.field static final CONSTRUCTOR_PARAMS:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field static final INSETS_HELPER:Landroid/support/design/widget/CoordinatorLayoutInsetsHelper;

.field static final TOP_SORTED_CHILDREN_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field static final WIDGET_PACKAGE_NAME:Ljava/lang/String;

.field static final sConstructors:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor",
            "<",
            "Landroid/support/design/widget/CoordinatorLayout$Behavior;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private mBehaviorTouchView:Landroid/view/View;

.field private final mDependencySortedChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mDrawStatusBarBackground:Z

.field private mIsAttachedToWindow:Z

.field private mKeylines:[I

.field private mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

.field final mLayoutDependencyComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mNeedsPreDrawListener:Z

.field private mNestedScrollingDirectChild:Landroid/view/View;

.field private final mNestedScrollingParentHelper:Landroid/support/v4/view/NestedScrollingParentHelper;

.field private mNestedScrollingTarget:Landroid/view/View;

.field private mOnHierarchyChangeListener:Landroid/view/ViewGroup$OnHierarchyChangeListener;

.field private mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

.field private mScrimPaint:Landroid/graphics/Paint;

.field private mStatusBarBackground:Landroid/graphics/drawable/Drawable;

.field private final mTempIntPair:[I

.field private final mTempList1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempRect1:Landroid/graphics/Rect;

.field private final mTempRect2:Landroid/graphics/Rect;

.field private final mTempRect3:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 88
    const-class v0, Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->WIDGET_PACKAGE_NAME:Ljava/lang/String;

    .line 91
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_38

    .line 92
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$ViewElevationComparator;

    invoke-direct {v0}, Landroid/support/design/widget/CoordinatorLayout$ViewElevationComparator;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->TOP_SORTED_CHILDREN_COMPARATOR:Ljava/util/Comparator;

    .line 93
    new-instance v0, Landroid/support/design/widget/CoordinatorLayoutInsetsHelperLollipop;

    invoke-direct {v0}, Landroid/support/design/widget/CoordinatorLayoutInsetsHelperLollipop;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->INSETS_HELPER:Landroid/support/design/widget/CoordinatorLayoutInsetsHelper;

    .line 100
    :goto_21
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->CONSTRUCTOR_PARAMS:[Ljava/lang/Class;

    .line 105
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->sConstructors:Ljava/lang/ThreadLocal;

    return-void

    .line 95
    :cond_38
    sput-object v2, Landroid/support/design/widget/CoordinatorLayout;->TOP_SORTED_CHILDREN_COMPARATOR:Ljava/util/Comparator;

    .line 96
    sput-object v2, Landroid/support/design/widget/CoordinatorLayout;->INSETS_HELPER:Landroid/support/design/widget/CoordinatorLayoutInsetsHelper;

    goto :goto_21
.end method

.method private dispatchChildApplyWindowInsets(Landroid/support/v4/view/WindowInsetsCompat;)V
    .registers 8
    .param p1, "insets"    # Landroid/support/v4/view/WindowInsetsCompat;

    .prologue
    .line 670
    invoke-virtual {p1}, Landroid/support/v4/view/WindowInsetsCompat;->isConsumed()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 696
    :cond_6
    return-void

    .line 674
    :cond_7
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v4

    .local v4, "z":I
    :goto_c
    if-ge v2, v4, :cond_6

    .line 675
    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 676
    .local v1, "child":Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 677
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 678
    .local v3, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v3}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 680
    .local v0, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_2e

    .line 682
    invoke-virtual {v0, p0, v1, p1}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onApplyWindowInsets(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;

    move-result-object p1

    .line 683
    invoke-virtual {p1}, Landroid/support/v4/view/WindowInsetsCompat;->isConsumed()Z

    move-result v5

    if-nez v5, :cond_6

    .line 690
    :cond_2e
    invoke-static {v1, p1}, Landroid/support/v4/view/ViewCompat;->dispatchApplyWindowInsets(Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;

    move-result-object p1

    .line 691
    invoke-virtual {p1}, Landroid/support/v4/view/WindowInsetsCompat;->isConsumed()Z

    move-result v5

    if-nez v5, :cond_6

    .line 674
    .end local v0    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v3    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method private getKeyline(I)I
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v0, 0x0

    .line 452
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mKeylines:[I

    if-nez v1, :cond_28

    .line 453
    const-string v1, "CoordinatorLayout"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No keylines defined for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - attempted index lookup "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    :goto_27
    return v0

    .line 457
    :cond_28
    if-ltz p1, :cond_2f

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mKeylines:[I

    array-length v1, v1

    if-lt p1, v1, :cond_52

    .line 458
    :cond_2f
    const-string v1, "CoordinatorLayout"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Keyline index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " out of range for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_27

    .line 462
    :cond_52
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mKeylines:[I

    aget v0, v0, p1

    goto :goto_27
.end method

.method private getTopSortedChildren(Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 305
    .local p1, "out":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 307
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->isChildrenDrawingOrderEnabled()Z

    move-result v4

    .line 308
    .local v4, "useCustomOrder":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v1

    .line 309
    .local v1, "childCount":I
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_d
    if-ltz v3, :cond_21

    .line 310
    if-eqz v4, :cond_1f

    invoke-virtual {p0, v1, v3}, Landroid/support/design/widget/CoordinatorLayout;->getChildDrawingOrder(II)I

    move-result v2

    .line 311
    .local v2, "childIndex":I
    :goto_15
    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 312
    .local v0, "child":Landroid/view/View;
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    add-int/lit8 v3, v3, -0x1

    goto :goto_d

    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childIndex":I
    :cond_1f
    move v2, v3

    .line 310
    goto :goto_15

    .line 315
    :cond_21
    sget-object v5, Landroid/support/design/widget/CoordinatorLayout;->TOP_SORTED_CHILDREN_COMPARATOR:Ljava/util/Comparator;

    if-eqz v5, :cond_2a

    .line 316
    sget-object v5, Landroid/support/design/widget/CoordinatorLayout;->TOP_SORTED_CHILDREN_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p1, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 318
    :cond_2a
    return-void
.end method

.method private layoutChild(Landroid/view/View;I)V
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutDirection"    # I

    .prologue
    .line 989
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 990
    .local v6, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-object v3, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect1:Landroid/graphics/Rect;

    .line 991
    .local v3, "parent":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v0

    iget v1, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->leftMargin:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v1

    iget v2, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->topMargin:I

    add-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v5

    sub-int/2addr v2, v5

    iget v5, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->rightMargin:I

    sub-int/2addr v2, v5

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v5, v7

    iget v7, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v5, v7

    invoke-virtual {v3, v0, v1, v2, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 996
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v0, :cond_6d

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_6d

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_6d

    .line 1000
    iget v0, v3, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v1}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetLeft()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, v3, Landroid/graphics/Rect;->left:I

    .line 1001
    iget v0, v3, Landroid/graphics/Rect;->top:I

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v1}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, v3, Landroid/graphics/Rect;->top:I

    .line 1002
    iget v0, v3, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v1}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetRight()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, v3, Landroid/graphics/Rect;->right:I

    .line 1003
    iget v0, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v1}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetBottom()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, v3, Landroid/graphics/Rect;->bottom:I

    .line 1006
    :cond_6d
    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect2:Landroid/graphics/Rect;

    .line 1007
    .local v4, "out":Landroid/graphics/Rect;
    iget v0, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    invoke-static {v0}, Landroid/support/design/widget/CoordinatorLayout;->resolveGravity(I)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    move v5, p2

    invoke-static/range {v0 .. v5}, Landroid/support/v4/view/GravityCompat;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 1009
    iget v0, v4, Landroid/graphics/Rect;->left:I

    iget v1, v4, Landroid/graphics/Rect;->top:I

    iget v2, v4, Landroid/graphics/Rect;->right:I

    iget v5, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, v5}, Landroid/view/View;->layout(IIII)V

    .line 1010
    return-void
.end method

.method private layoutChildWithAnchor(Landroid/view/View;Landroid/view/View;I)V
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "anchor"    # Landroid/view/View;
    .param p3, "layoutDirection"    # I

    .prologue
    .line 904
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 906
    .local v2, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect1:Landroid/graphics/Rect;

    .line 907
    .local v0, "anchorRect":Landroid/graphics/Rect;
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect2:Landroid/graphics/Rect;

    .line 908
    .local v1, "childRect":Landroid/graphics/Rect;
    invoke-virtual {p0, p2, v0}, Landroid/support/design/widget/CoordinatorLayout;->getDescendantRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 909
    invoke-virtual {p0, p1, p3, v0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getDesiredAnchoredChildRect(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 911
    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    iget v6, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 912
    return-void
.end method

.method private layoutChildWithKeyline(Landroid/view/View;II)V
    .registers 18
    .param p1, "child"    # Landroid/view/View;
    .param p2, "keyline"    # I
    .param p3, "layoutDirection"    # I

    .prologue
    .line 926
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 927
    .local v7, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget v11, v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    invoke-static {v11}, Landroid/support/design/widget/CoordinatorLayout;->resolveKeylineGravity(I)I

    move-result v11

    move/from16 v0, p3

    invoke-static {v11, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    .line 930
    .local v1, "absGravity":I
    and-int/lit8 v5, v1, 0x7

    .line 931
    .local v5, "hgrav":I
    and-int/lit8 v9, v1, 0x70

    .line 932
    .local v9, "vgrav":I
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v10

    .line 933
    .local v10, "width":I
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v4

    .line 934
    .local v4, "height":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 935
    .local v3, "childWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    .line 937
    .local v2, "childHeight":I
    const/4 v11, 0x1

    move/from16 v0, p3

    if-ne v0, v11, :cond_2d

    .line 938
    sub-int p2, v10, p2

    .line 941
    :cond_2d
    move/from16 v0, p2

    invoke-direct {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->getKeyline(I)I

    move-result v11

    sub-int v6, v11, v3

    .line 942
    .local v6, "left":I
    const/4 v8, 0x0

    .line 944
    .local v8, "top":I
    sparse-switch v5, :sswitch_data_82

    .line 957
    :goto_39
    sparse-switch v9, :sswitch_data_8c

    .line 971
    :goto_3c
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v11

    iget v12, v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->leftMargin:I

    add-int/2addr v11, v12

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v12

    sub-int v12, v10, v12

    sub-int/2addr v12, v3

    iget v13, v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->rightMargin:I

    sub-int/2addr v12, v13

    invoke-static {v6, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 974
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v11

    iget v12, v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->topMargin:I

    add-int/2addr v11, v12

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v12

    sub-int v12, v4, v12

    sub-int/2addr v12, v2

    iget v13, v7, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v12, v13

    invoke-static {v8, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 978
    add-int v11, v6, v3

    add-int v12, v8, v2

    invoke-virtual {p1, v6, v8, v11, v12}, Landroid/view/View;->layout(IIII)V

    .line 979
    return-void

    .line 950
    :sswitch_76
    add-int/2addr v6, v3

    .line 951
    goto :goto_39

    .line 953
    :sswitch_78
    div-int/lit8 v11, v3, 0x2

    add-int/2addr v6, v11

    goto :goto_39

    .line 963
    :sswitch_7c
    add-int/2addr v8, v2

    .line 964
    goto :goto_3c

    .line 966
    :sswitch_7e
    div-int/lit8 v11, v2, 0x2

    add-int/2addr v8, v11

    goto :goto_3c

    .line 944
    :sswitch_data_82
    .sparse-switch
        0x1 -> :sswitch_78
        0x5 -> :sswitch_76
    .end sparse-switch

    .line 957
    :sswitch_data_8c
    .sparse-switch
        0x10 -> :sswitch_7e
        0x50 -> :sswitch_7c
    .end sparse-switch
.end method

.method static parseBehavior(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x2e

    .line 466
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 467
    const/4 v5, 0x0

    .line 495
    :goto_9
    return-object v5

    .line 471
    :cond_a
    const-string v5, "."

    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_65

    .line 473
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 483
    .local v4, "fullName":Ljava/lang/String;
    :goto_27
    :try_start_27
    sget-object v5, Landroid/support/design/widget/CoordinatorLayout;->sConstructors:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 484
    .local v2, "constructors":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;>;"
    if-nez v2, :cond_3b

    .line 485
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "constructors":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 486
    .restart local v2    # "constructors":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;>;"
    sget-object v5, Landroid/support/design/widget/CoordinatorLayout;->sConstructors:Ljava/lang/ThreadLocal;

    invoke-virtual {v5, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 488
    :cond_3b
    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 489
    .local v0, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;"
    if-nez v0, :cond_55

    .line 490
    const/4 v5, 0x1

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 492
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;"
    sget-object v5, Landroid/support/design/widget/CoordinatorLayout;->CONSTRUCTOR_PARAMS:[Ljava/lang/Class;

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 493
    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;"
    :cond_55
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/CoordinatorLayout$Behavior;
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_64} :catch_85

    goto :goto_9

    .line 474
    .end local v0    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;"
    .end local v2    # "constructors":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/reflect/Constructor<Landroid/support/design/widget/CoordinatorLayout$Behavior;>;>;"
    .end local v4    # "fullName":Ljava/lang/String;
    :cond_65
    invoke-virtual {p2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ltz v5, :cond_6d

    .line 476
    move-object v4, p2

    .restart local v4    # "fullName":Ljava/lang/String;
    goto :goto_27

    .line 479
    .end local v4    # "fullName":Ljava/lang/String;
    :cond_6d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/support/design/widget/CoordinatorLayout;->WIDGET_PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "fullName":Ljava/lang/String;
    goto :goto_27

    .line 496
    :catch_85
    move-exception v3

    .line 497
    .local v3, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not inflate Behavior subclass "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private performIntercept(Landroid/view/MotionEvent;)Z
    .registers 24
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 321
    const/16 v16, 0x0

    .line 322
    .local v16, "intercepted":Z
    const/16 v19, 0x0

    .line 324
    .local v19, "newBlock":Z
    const/4 v12, 0x0

    .line 326
    .local v12, "cancelEvent":Landroid/view/MotionEvent;
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v10

    .line 328
    .local v10, "action":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/design/widget/CoordinatorLayout;->mTempList1:Ljava/util/List;

    move-object/from16 v20, v0

    .line 329
    .local v20, "topmostChildList":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getTopSortedChildren(Ljava/util/List;)V

    .line 332
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v14

    .line 333
    .local v14, "childCount":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1b
    if-ge v15, v14, :cond_76

    .line 334
    move-object/from16 v0, v20

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    .line 335
    .local v13, "child":Landroid/view/View;
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    check-cast v18, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 336
    .local v18, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual/range {v18 .. v18}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v11

    .line 338
    .local v11, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-nez v16, :cond_33

    if-eqz v19, :cond_4e

    :cond_33
    if-eqz v10, :cond_4e

    .line 341
    if-eqz v11, :cond_4b

    .line 342
    if-eqz v12, :cond_46

    .line 343
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 344
    .local v2, "now":J
    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v4, v2

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v12

    .line 347
    .end local v2    # "now":J
    :cond_46
    move-object/from16 v0, p0

    invoke-virtual {v11, v0, v13, v12}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 333
    :cond_4b
    add-int/lit8 v15, v15, 0x1

    goto :goto_1b

    .line 352
    :cond_4e
    if-nez v16, :cond_60

    if-eqz v11, :cond_60

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v11, v0, v13, v1}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v16

    if-eqz v16, :cond_60

    .line 354
    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    .line 359
    :cond_60
    invoke-virtual/range {v18 .. v18}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->didBlockInteraction()Z

    move-result v21

    .line 360
    .local v21, "wasBlocking":Z
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v13}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isBlockingInteractionBelow(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z

    move-result v17

    .line 361
    .local v17, "isBlocking":Z
    if-eqz v17, :cond_7a

    if-nez v21, :cond_7a

    const/16 v19, 0x1

    .line 362
    :goto_72
    if-eqz v17, :cond_4b

    if-nez v19, :cond_4b

    .line 369
    .end local v11    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v13    # "child":Landroid/view/View;
    .end local v17    # "isBlocking":Z
    .end local v18    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v21    # "wasBlocking":Z
    :cond_76
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->clear()V

    .line 371
    return v16

    .line 361
    .restart local v11    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .restart local v13    # "child":Landroid/view/View;
    .restart local v17    # "isBlocking":Z
    .restart local v18    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .restart local v21    # "wasBlocking":Z
    :cond_7a
    const/16 v19, 0x0

    goto :goto_72
.end method

.method private prepareChildren()V
    .registers 8

    .prologue
    .line 524
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v1

    .line 526
    .local v1, "childCount":I
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v5, v1, :cond_27

    const/4 v4, 0x1

    .line 528
    .local v4, "resortRequired":Z
    :goto_d
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-ge v2, v1, :cond_29

    .line 529
    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 530
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->getResolvedLayoutParams(Landroid/view/View;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v3

    .line 531
    .local v3, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    if-nez v4, :cond_21

    invoke-virtual {v3, p0, v0}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isDirty(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 532
    const/4 v4, 0x1

    .line 534
    :cond_21
    invoke-virtual {v3, p0, v0}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->findAnchorView(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/view/View;

    .line 528
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 526
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "i":I
    .end local v3    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v4    # "resortRequired":Z
    :cond_27
    const/4 v4, 0x0

    goto :goto_d

    .line 537
    .restart local v2    # "i":I
    .restart local v4    # "resortRequired":Z
    :cond_29
    if-eqz v4, :cond_46

    .line 538
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 539
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v1, :cond_3f

    .line 540
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 539
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 542
    :cond_3f
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mLayoutDependencyComparator:Ljava/util/Comparator;

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 544
    :cond_46
    return-void
.end method

.method private resetTouchBehaviors()V
    .registers 15

    .prologue
    const/4 v5, 0x0

    .line 280
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    if-eqz v2, :cond_2a

    .line 281
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v8

    .line 282
    .local v8, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v8, :cond_27

    .line 283
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 284
    .local v0, "now":J
    const/4 v4, 0x3

    const/4 v7, 0x0

    move-wide v2, v0

    move v6, v5

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .line 286
    .local v9, "cancelEvent":Landroid/view/MotionEvent;
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    invoke-virtual {v8, p0, v2, v9}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 287
    invoke-virtual {v9}, Landroid/view/MotionEvent;->recycle()V

    .line 289
    .end local v0    # "now":J
    .end local v9    # "cancelEvent":Landroid/view/MotionEvent;
    :cond_27
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    .line 292
    .end local v8    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    :cond_2a
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v11

    .line 293
    .local v11, "childCount":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2f
    if-ge v12, v11, :cond_41

    .line 294
    invoke-virtual {p0, v12}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 295
    .local v10, "child":Landroid/view/View;
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 296
    .local v13, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v13}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->resetTouchBehaviorTracking()V

    .line 293
    add-int/lit8 v12, v12, 0x1

    goto :goto_2f

    .line 298
    .end local v10    # "child":Landroid/view/View;
    .end local v13    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_41
    return-void
.end method

.method private static resolveAnchoredChildGravity(I)I
    .registers 1
    .param p0, "gravity"    # I

    .prologue
    .line 1033
    if-nez p0, :cond_4

    const/16 p0, 0x11

    .end local p0    # "gravity":I
    :cond_4
    return p0
.end method

.method private static resolveGravity(I)I
    .registers 1
    .param p0, "gravity"    # I

    .prologue
    .line 1017
    if-nez p0, :cond_5

    const p0, 0x800033

    .end local p0    # "gravity":I
    :cond_5
    return p0
.end method

.method private static resolveKeylineGravity(I)I
    .registers 1
    .param p0, "gravity"    # I

    .prologue
    .line 1025
    if-nez p0, :cond_5

    const p0, 0x800035

    .end local p0    # "gravity":I
    :cond_5
    return p0
.end method

.method private setWindowInsets(Landroid/support/v4/view/WindowInsetsCompat;)V
    .registers 5
    .param p1, "insets"    # Landroid/support/v4/view/WindowInsetsCompat;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 264
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eq v0, p1, :cond_26

    .line 265
    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    .line 266
    if-eqz p1, :cond_27

    invoke-virtual {p1}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    if-lez v0, :cond_27

    move v0, v1

    :goto_11
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mDrawStatusBarBackground:Z

    .line 267
    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mDrawStatusBarBackground:Z

    if-nez v0, :cond_29

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_29

    :goto_1d
    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->setWillNotDraw(Z)V

    .line 268
    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->dispatchChildApplyWindowInsets(Landroid/support/v4/view/WindowInsetsCompat;)V

    .line 269
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->requestLayout()V

    .line 271
    :cond_26
    return-void

    :cond_27
    move v0, v2

    .line 266
    goto :goto_11

    :cond_29
    move v1, v2

    .line 267
    goto :goto_1d
.end method


# virtual methods
.method addPreDrawListener()V
    .registers 3

    .prologue
    .line 1244
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    if-eqz v1, :cond_18

    .line 1246
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    if-nez v1, :cond_f

    .line 1247
    new-instance v1, Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-direct {v1, p0}, Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;-><init>(Landroid/support/design/widget/CoordinatorLayout;)V

    iput-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    .line 1249
    :cond_f
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1250
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1255
    .end local v0    # "vto":Landroid/view/ViewTreeObserver;
    :cond_18
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNeedsPreDrawListener:Z

    .line 1256
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1369
    instance-of v0, p1, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

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

.method public dispatchDependentViewsChanged(Landroid/view/View;)V
    .registers 9
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1145
    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    .line 1146
    .local v2, "childCount":I
    const/4 v5, 0x0

    .line 1147
    .local v5, "viewSeen":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    if-ge v3, v2, :cond_30

    .line 1148
    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 1149
    .local v1, "child":Landroid/view/View;
    if-ne v1, p1, :cond_18

    .line 1151
    const/4 v5, 0x1

    .line 1147
    :cond_15
    :goto_15
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 1154
    :cond_18
    if-eqz v5, :cond_15

    .line 1155
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1157
    .local v4, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v4}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1158
    .local v0, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_15

    invoke-virtual {v4, p0, v1, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->dependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_15

    .line 1159
    invoke-virtual {v0, p0, v1, p1}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onDependentViewChanged(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    goto :goto_15

    .line 1163
    .end local v0    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v1    # "child":Landroid/view/View;
    .end local v4    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_30
    return-void
.end method

.method dispatchOnDependentViewChanged(Z)V
    .registers 15
    .param p1, "fromNestedScroll"    # Z

    .prologue
    .line 1070
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v8

    .line 1071
    .local v8, "layoutDirection":I
    iget-object v12, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v4

    .line 1072
    .local v4, "childCount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_b
    if-ge v6, v4, :cond_7d

    .line 1073
    iget-object v12, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1074
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1077
    .local v9, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_1c
    if-ge v7, v6, :cond_30

    .line 1078
    iget-object v12, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 1080
    .local v1, "checkChild":Landroid/view/View;
    iget-object v12, v9, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorDirectChild:Landroid/view/View;

    if-ne v12, v1, :cond_2d

    .line 1081
    invoke-virtual {p0, v3, v8}, Landroid/support/design/widget/CoordinatorLayout;->offsetChildToAnchor(Landroid/view/View;I)V

    .line 1077
    :cond_2d
    add-int/lit8 v7, v7, 0x1

    goto :goto_1c

    .line 1086
    .end local v1    # "checkChild":Landroid/view/View;
    :cond_30
    iget-object v11, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect1:Landroid/graphics/Rect;

    .line 1087
    .local v11, "oldRect":Landroid/graphics/Rect;
    iget-object v10, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect2:Landroid/graphics/Rect;

    .line 1088
    .local v10, "newRect":Landroid/graphics/Rect;
    invoke-virtual {p0, v3, v11}, Landroid/support/design/widget/CoordinatorLayout;->getLastChildRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1089
    const/4 v12, 0x1

    invoke-virtual {p0, v3, v12, v10}, Landroid/support/design/widget/CoordinatorLayout;->getChildRect(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 1090
    invoke-virtual {v11, v10}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_44

    .line 1072
    :cond_41
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    .line 1093
    :cond_44
    invoke-virtual {p0, v3, v10}, Landroid/support/design/widget/CoordinatorLayout;->recordLastChildRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1096
    add-int/lit8 v7, v6, 0x1

    :goto_49
    if-ge v7, v4, :cond_41

    .line 1097
    iget-object v12, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 1098
    .restart local v1    # "checkChild":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1099
    .local v2, "checkLp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1101
    .local v0, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_70

    invoke-virtual {v0, p0, v1, v3}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->layoutDependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v12

    if-eqz v12, :cond_70

    .line 1102
    if-nez p1, :cond_73

    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getChangedAfterNestedScroll()Z

    move-result v12

    if-eqz v12, :cond_73

    .line 1105
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->resetChangedAfterNestedScroll()V

    .line 1096
    :cond_70
    :goto_70
    add-int/lit8 v7, v7, 0x1

    goto :goto_49

    .line 1109
    :cond_73
    invoke-virtual {v0, p0, v1, v3}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onDependentViewChanged(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v5

    .line 1111
    .local v5, "handled":Z
    if-eqz p1, :cond_70

    .line 1114
    invoke-virtual {v2, v5}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setChangedAfterNestedScroll(Z)V

    goto :goto_70

    .line 1119
    .end local v0    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v1    # "checkChild":Landroid/view/View;
    .end local v2    # "checkLp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "handled":Z
    .end local v7    # "j":I
    .end local v9    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v10    # "newRect":Landroid/graphics/Rect;
    .end local v11    # "oldRect":Landroid/graphics/Rect;
    :cond_7d
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .prologue
    .line 1038
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1039
    .local v6, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    if-eqz v0, :cond_4f

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v0, p0, p2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->getScrimOpacity(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4f

    .line 1040
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mScrimPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_20

    .line 1041
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mScrimPaint:Landroid/graphics/Paint;

    .line 1043
    :cond_20
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mScrimPaint:Landroid/graphics/Paint;

    iget-object v1, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehavior:Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v1, p0, p2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->getScrimColor(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1046
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v0

    int-to-float v1, v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v0

    int-to-float v2, v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v3, v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mScrimPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1049
    :cond_4f
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v0

    return v0
.end method

.method ensurePreDrawListener()V
    .registers 6

    .prologue
    .line 1198
    const/4 v2, 0x0

    .line 1199
    .local v2, "hasDependencies":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v1

    .line 1200
    .local v1, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v1, :cond_13

    .line 1201
    invoke-virtual {p0, v3}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1202
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->hasDependencies(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 1203
    const/4 v2, 0x1

    .line 1208
    .end local v0    # "child":Landroid/view/View;
    :cond_13
    iget-boolean v4, p0, Landroid/support/design/widget/CoordinatorLayout;->mNeedsPreDrawListener:Z

    if-eq v2, v4, :cond_1c

    .line 1209
    if-eqz v2, :cond_20

    .line 1210
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->addPreDrawListener()V

    .line 1215
    :cond_1c
    :goto_1c
    return-void

    .line 1200
    .restart local v0    # "child":Landroid/view/View;
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 1212
    .end local v0    # "child":Landroid/view/View;
    :cond_20
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->removePreDrawListener()V

    goto :goto_1c
.end method

.method protected generateDefaultLayoutParams()Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 1364
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 86
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1349
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1354
    instance-of v0, p1, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    if-eqz v0, :cond_c

    .line 1355
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    check-cast p1, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(Landroid/support/design/widget/CoordinatorLayout$LayoutParams;)V

    .line 1359
    :goto_b
    return-object v0

    .line 1356
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_18

    .line 1357
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_b

    .line 1359
    .restart local p1    # "p":Landroid/view/ViewGroup$LayoutParams;
    :cond_18
    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 86
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 86
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method getChildRect(Landroid/view/View;ZLandroid/graphics/Rect;)V
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "transform"    # Z
    .param p3, "out"    # Landroid/graphics/Rect;

    .prologue
    const/4 v2, 0x0

    .line 787
    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_13

    .line 788
    :cond_f
    invoke-virtual {p3, v2, v2, v2, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 796
    :goto_12
    return-void

    .line 791
    :cond_13
    if-eqz p2, :cond_19

    .line 792
    invoke-virtual {p0, p1, p3}, Landroid/support/design/widget/CoordinatorLayout;->getDescendantRect(Landroid/view/View;Landroid/graphics/Rect;)V

    goto :goto_12

    .line 794
    :cond_19
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p3, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_12
.end method

.method getDescendantRect(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "descendant"    # Landroid/view/View;
    .param p2, "out"    # Landroid/graphics/Rect;

    .prologue
    .line 554
    invoke-static {p0, p1, p2}, Landroid/support/design/widget/ViewGroupUtils;->getDescendantRect(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 555
    return-void
.end method

.method getDesiredAnchoredChildRect(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 22
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutDirection"    # I
    .param p3, "anchorRect"    # Landroid/graphics/Rect;
    .param p4, "out"    # Landroid/graphics/Rect;

    .prologue
    .line 808
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 809
    .local v10, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget v14, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    invoke-static {v14}, Landroid/support/design/widget/CoordinatorLayout;->resolveAnchoredChildGravity(I)I

    move-result v14

    move/from16 v0, p2

    invoke-static {v14, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v2

    .line 811
    .local v2, "absGravity":I
    iget v14, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->anchorGravity:I

    invoke-static {v14}, Landroid/support/design/widget/CoordinatorLayout;->resolveGravity(I)I

    move-result v14

    move/from16 v0, p2

    invoke-static {v14, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v1

    .line 815
    .local v1, "absAnchorGravity":I
    and-int/lit8 v8, v2, 0x7

    .line 816
    .local v8, "hgrav":I
    and-int/lit8 v12, v2, 0x70

    .line 817
    .local v12, "vgrav":I
    and-int/lit8 v3, v1, 0x7

    .line 818
    .local v3, "anchorHgrav":I
    and-int/lit8 v4, v1, 0x70

    .line 820
    .local v4, "anchorVgrav":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    .line 821
    .local v6, "childWidth":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 829
    .local v5, "childHeight":I
    sparse-switch v3, :sswitch_data_ba

    .line 832
    move-object/from16 v0, p3

    iget v9, v0, Landroid/graphics/Rect;->left:I

    .line 842
    .local v9, "left":I
    :goto_35
    sparse-switch v4, :sswitch_data_c4

    .line 845
    move-object/from16 v0, p3

    iget v11, v0, Landroid/graphics/Rect;->top:I

    .line 856
    .local v11, "top":I
    :goto_3c
    sparse-switch v8, :sswitch_data_ce

    .line 859
    sub-int/2addr v9, v6

    .line 869
    :goto_40
    :sswitch_40
    sparse-switch v12, :sswitch_data_d8

    .line 872
    sub-int/2addr v11, v5

    .line 882
    :goto_44
    :sswitch_44
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v13

    .line 883
    .local v13, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v7

    .line 886
    .local v7, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v14

    iget v15, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->leftMargin:I

    add-int/2addr v14, v15

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v15

    sub-int v15, v13, v15

    sub-int/2addr v15, v6

    iget v0, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->rightMargin:I

    move/from16 v16, v0

    sub-int v15, v15, v16

    invoke-static {v9, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 889
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v14

    iget v15, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->topMargin:I

    add-int/2addr v14, v15

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v15

    sub-int v15, v7, v15

    sub-int/2addr v15, v5

    iget v0, v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->bottomMargin:I

    move/from16 v16, v0

    sub-int v15, v15, v16

    invoke-static {v11, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 893
    add-int v14, v9, v6

    add-int v15, v11, v5

    move-object/from16 v0, p4

    invoke-virtual {v0, v9, v11, v14, v15}, Landroid/graphics/Rect;->set(IIII)V

    .line 894
    return-void

    .line 835
    .end local v7    # "height":I
    .end local v9    # "left":I
    .end local v11    # "top":I
    .end local v13    # "width":I
    :sswitch_8e
    move-object/from16 v0, p3

    iget v9, v0, Landroid/graphics/Rect;->right:I

    .line 836
    .restart local v9    # "left":I
    goto :goto_35

    .line 838
    .end local v9    # "left":I
    :sswitch_93
    move-object/from16 v0, p3

    iget v14, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->width()I

    move-result v15

    div-int/lit8 v15, v15, 0x2

    add-int v9, v14, v15

    .restart local v9    # "left":I
    goto :goto_35

    .line 848
    :sswitch_a0
    move-object/from16 v0, p3

    iget v11, v0, Landroid/graphics/Rect;->bottom:I

    .line 849
    .restart local v11    # "top":I
    goto :goto_3c

    .line 851
    .end local v11    # "top":I
    :sswitch_a5
    move-object/from16 v0, p3

    iget v14, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->height()I

    move-result v15

    div-int/lit8 v15, v15, 0x2

    add-int v11, v14, v15

    .restart local v11    # "top":I
    goto :goto_3c

    .line 865
    :sswitch_b2
    div-int/lit8 v14, v6, 0x2

    sub-int/2addr v9, v14

    goto :goto_40

    .line 878
    :sswitch_b6
    div-int/lit8 v14, v5, 0x2

    sub-int/2addr v11, v14

    goto :goto_44

    .line 829
    :sswitch_data_ba
    .sparse-switch
        0x1 -> :sswitch_93
        0x5 -> :sswitch_8e
    .end sparse-switch

    .line 842
    :sswitch_data_c4
    .sparse-switch
        0x10 -> :sswitch_a5
        0x50 -> :sswitch_a0
    .end sparse-switch

    .line 856
    :sswitch_data_ce
    .sparse-switch
        0x1 -> :sswitch_b2
        0x5 -> :sswitch_40
    .end sparse-switch

    .line 869
    :sswitch_data_d8
    .sparse-switch
        0x10 -> :sswitch_b6
        0x50 -> :sswitch_44
    .end sparse-switch
.end method

.method getLastChildRect(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "out"    # Landroid/graphics/Rect;

    .prologue
    .line 773
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 774
    .local v0, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getLastChildRect()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 775
    return-void
.end method

.method public getNestedScrollAxes()I
    .registers 2

    .prologue
    .line 1539
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingParentHelper:Landroid/support/v4/view/NestedScrollingParentHelper;

    invoke-virtual {v0}, Landroid/support/v4/view/NestedScrollingParentHelper;->getNestedScrollAxes()I

    move-result v0

    return v0
.end method

.method getResolvedLayoutParams(Landroid/view/View;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .registers 9
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 502
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 503
    .local v3, "result":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-boolean v4, v3, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    if-nez v4, :cond_32

    .line 504
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 505
    .local v0, "childClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 506
    .local v1, "defaultBehavior":Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    :goto_f
    if-eqz v0, :cond_20

    const-class v4, Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    .end local v1    # "defaultBehavior":Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    check-cast v1, Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;

    .restart local v1    # "defaultBehavior":Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    if-nez v1, :cond_20

    .line 508
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_f

    .line 510
    :cond_20
    if-eqz v1, :cond_2f

    .line 512
    :try_start_22
    invoke-interface {v1}, Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;->value()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2f} :catch_33

    .line 518
    :cond_2f
    :goto_2f
    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mBehaviorResolved:Z

    .line 520
    .end local v0    # "childClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "defaultBehavior":Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    :cond_32
    return-object v3

    .line 513
    .restart local v0    # "childClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "defaultBehavior":Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;
    :catch_33
    move-exception v2

    .line 514
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "CoordinatorLayout"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Default behavior class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Landroid/support/design/widget/CoordinatorLayout$DefaultBehavior;->value()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " could not be instantiated. Did you forget a default constructor?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2f
.end method

.method public getStatusBarBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected getSuggestedMinimumHeight()I
    .registers 4

    .prologue
    .line 564
    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected getSuggestedMinimumWidth()I
    .registers 4

    .prologue
    .line 559
    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method hasDependencies(Landroid/view/View;)Z
    .registers 8
    .param p1, "child"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    .line 1221
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1222
    .local v2, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-object v5, v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-eqz v5, :cond_c

    .line 1236
    :goto_b
    return v4

    .line 1226
    :cond_c
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    .line 1227
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    if-ge v1, v0, :cond_23

    .line 1228
    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1229
    .local v3, "other":Landroid/view/View;
    if-ne v3, p1, :cond_1c

    .line 1227
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 1232
    :cond_1c
    invoke-virtual {v2, p0, p1, v3}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->dependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_19

    goto :goto_b

    .line 1236
    .end local v3    # "other":Landroid/view/View;
    :cond_23
    const/4 v4, 0x0

    goto :goto_b
.end method

.method public isPointInChildBounds(Landroid/view/View;II)Z
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 1321
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect1:Landroid/graphics/Rect;

    .line 1322
    .local v0, "r":Landroid/graphics/Rect;
    invoke-virtual {p0, p1, v0}, Landroid/support/design/widget/CoordinatorLayout;->getDescendantRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1323
    invoke-virtual {v0, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    return v1
.end method

.method offsetChildToAnchor(Landroid/view/View;I)V
    .registers 12
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutDirection"    # I

    .prologue
    .line 1281
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1282
    .local v6, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    iget-object v7, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-eqz v7, :cond_41

    .line 1283
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect1:Landroid/graphics/Rect;

    .line 1284
    .local v0, "anchorRect":Landroid/graphics/Rect;
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect2:Landroid/graphics/Rect;

    .line 1285
    .local v2, "childRect":Landroid/graphics/Rect;
    iget-object v3, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempRect3:Landroid/graphics/Rect;

    .line 1287
    .local v3, "desiredChildRect":Landroid/graphics/Rect;
    iget-object v7, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-virtual {p0, v7, v0}, Landroid/support/design/widget/CoordinatorLayout;->getDescendantRect(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1288
    const/4 v7, 0x0

    invoke-virtual {p0, p1, v7, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildRect(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 1289
    invoke-virtual {p0, p1, p2, v0, v3}, Landroid/support/design/widget/CoordinatorLayout;->getDesiredAnchoredChildRect(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 1291
    iget v7, v3, Landroid/graphics/Rect;->left:I

    iget v8, v2, Landroid/graphics/Rect;->left:I

    sub-int v4, v7, v8

    .line 1292
    .local v4, "dx":I
    iget v7, v3, Landroid/graphics/Rect;->top:I

    iget v8, v2, Landroid/graphics/Rect;->top:I

    sub-int v5, v7, v8

    .line 1294
    .local v5, "dy":I
    if-eqz v4, :cond_2d

    .line 1295
    invoke-virtual {p1, v4}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1297
    :cond_2d
    if-eqz v5, :cond_32

    .line 1298
    invoke-virtual {p1, v5}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 1301
    :cond_32
    if-nez v4, :cond_36

    if-eqz v5, :cond_41

    .line 1303
    :cond_36
    invoke-virtual {v6}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    .line 1304
    .local v1, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v1, :cond_41

    .line 1305
    iget-object v7, v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-virtual {v1, p0, p1, v7}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onDependentViewChanged(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    .line 1309
    .end local v0    # "anchorRect":Landroid/graphics/Rect;
    .end local v1    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "childRect":Landroid/graphics/Rect;
    .end local v3    # "desiredChildRect":Landroid/graphics/Rect;
    .end local v4    # "dx":I
    .end local v5    # "dy":I
    :cond_41
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 3

    .prologue
    .line 196
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 197
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 198
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNeedsPreDrawListener:Z

    if-eqz v1, :cond_1e

    .line 199
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    if-nez v1, :cond_15

    .line 200
    new-instance v1, Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-direct {v1, p0}, Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;-><init>(Landroid/support/design/widget/CoordinatorLayout;)V

    iput-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    .line 202
    :cond_15
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 203
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 205
    .end local v0    # "vto":Landroid/view/ViewTreeObserver;
    :cond_1e
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    .line 206
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 210
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 211
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 212
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNeedsPreDrawListener:Z

    if-eqz v1, :cond_17

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    if-eqz v1, :cond_17

    .line 213
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 214
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 216
    .end local v0    # "vto":Landroid/view/ViewTreeObserver;
    :cond_17
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingTarget:Landroid/view/View;

    if-eqz v1, :cond_20

    .line 217
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingTarget:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->onStopNestedScroll(Landroid/view/View;)V

    .line 219
    :cond_20
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    .line 220
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 740
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 741
    iget-boolean v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mDrawStatusBarBackground:Z

    if-eqz v2, :cond_26

    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_26

    .line 742
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v2, :cond_27

    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v2}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    .line 743
    .local v0, "inset":I
    :goto_16
    if-lez v0, :cond_26

    .line 744
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v3

    invoke-virtual {v2, v1, v1, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 745
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 748
    .end local v0    # "inset":I
    :cond_26
    return-void

    :cond_27
    move v0, v1

    .line 742
    goto :goto_16
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 376
    const/4 v1, 0x0

    .line 378
    .local v1, "cancelEvent":Landroid/view/MotionEvent;
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 381
    .local v0, "action":I
    if-nez v0, :cond_a

    .line 382
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 385
    :cond_a
    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->performIntercept(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 387
    .local v2, "intercepted":Z
    if-eqz v1, :cond_13

    .line 388
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 391
    :cond_13
    const/4 v3, 0x1

    if-eq v0, v3, :cond_19

    const/4 v3, 0x3

    if-ne v0, v3, :cond_1c

    .line 392
    :cond_19
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 395
    :cond_1c
    return v2
.end method

.method protected onLayout(ZIIII)V
    .registers 13
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 725
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v4

    .line 726
    .local v4, "layoutDirection":I
    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    .line 727
    .local v2, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    if-ge v3, v2, :cond_2d

    .line 728
    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 729
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 730
    .local v5, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v5}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 732
    .local v0, "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_27

    invoke-virtual {v0, p0, v1, v4}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result v6

    if-nez v6, :cond_2a

    .line 733
    :cond_27
    invoke-virtual {p0, v1, v4}, Landroid/support/design/widget/CoordinatorLayout;->onLayoutChild(Landroid/view/View;I)V

    .line 727
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 736
    .end local v0    # "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v1    # "child":Landroid/view/View;
    .end local v5    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_2d
    return-void
.end method

.method public onLayoutChild(Landroid/view/View;I)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "layoutDirection"    # I

    .prologue
    .line 709
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 710
    .local v0, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->checkAnchorChanged()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 711
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 714
    :cond_14
    iget-object v1, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    if-eqz v1, :cond_1e

    .line 715
    iget-object v1, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->mAnchorView:Landroid/view/View;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/design/widget/CoordinatorLayout;->layoutChildWithAnchor(Landroid/view/View;Landroid/view/View;I)V

    .line 721
    :goto_1d
    return-void

    .line 716
    :cond_1e
    iget v1, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    if-ltz v1, :cond_28

    .line 717
    iget v1, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    invoke-direct {p0, p1, v1, p2}, Landroid/support/design/widget/CoordinatorLayout;->layoutChildWithKeyline(Landroid/view/View;II)V

    goto :goto_1d

    .line 719
    :cond_28
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout;->layoutChild(Landroid/view/View;I)V

    goto :goto_1d
.end method

.method protected onMeasure(II)V
    .registers 37
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 588
    invoke-direct/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->prepareChildren()V

    .line 589
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->ensurePreDrawListener()V

    .line 591
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v25

    .line 592
    .local v25, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v27

    .line 593
    .local v27, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v26

    .line 594
    .local v26, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v24

    .line 595
    .local v24, "paddingBottom":I
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v22

    .line 596
    .local v22, "layoutDirection":I
    const/4 v3, 0x1

    move/from16 v0, v22

    if-ne v0, v3, :cond_12f

    const/16 v19, 0x1

    .line 597
    .local v19, "isRtl":Z
    :goto_21
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v30

    .line 598
    .local v30, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v32

    .line 599
    .local v32, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 600
    .local v13, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v15

    .line 602
    .local v15, "heightSize":I
    add-int v31, v25, v26

    .line 603
    .local v31, "widthPadding":I
    add-int v14, v27, v24

    .line 604
    .local v14, "heightPadding":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getSuggestedMinimumWidth()I

    move-result v33

    .line 605
    .local v33, "widthUsed":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getSuggestedMinimumHeight()I

    move-result v16

    .line 606
    .local v16, "heightUsed":I
    const/4 v11, 0x0

    .line 608
    .local v11, "childState":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v3, :cond_133

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_133

    const/4 v9, 0x1

    .line 610
    .local v9, "applyInsets":Z
    :goto_4b
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v10

    .line 611
    .local v10, "childCount":I
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_55
    move/from16 v0, v18

    if-ge v0, v10, :cond_14d

    .line 612
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->mDependencySortedChildren:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 613
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v23

    check-cast v23, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 615
    .local v23, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    const/4 v6, 0x0

    .line 616
    .local v6, "keylineWidthUsed":I
    move-object/from16 v0, v23

    iget v3, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    if-ltz v3, :cond_a5

    if-eqz v30, :cond_a5

    .line 617
    move-object/from16 v0, v23

    iget v3, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->keyline:I

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/design/widget/CoordinatorLayout;->getKeyline(I)I

    move-result v21

    .line 618
    .local v21, "keylinePos":I
    move-object/from16 v0, v23

    iget v3, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->gravity:I

    invoke-static {v3}, Landroid/support/design/widget/CoordinatorLayout;->resolveKeylineGravity(I)I

    move-result v3

    move/from16 v0, v22

    invoke-static {v3, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result v3

    and-int/lit8 v20, v3, 0x7

    .line 621
    .local v20, "keylineGravity":I
    const/4 v3, 0x3

    move/from16 v0, v20

    if-ne v0, v3, :cond_95

    if-eqz v19, :cond_9c

    :cond_95
    const/4 v3, 0x5

    move/from16 v0, v20

    if-ne v0, v3, :cond_136

    if-eqz v19, :cond_136

    .line 623
    :cond_9c
    const/4 v3, 0x0

    sub-int v8, v32, v26

    sub-int v8, v8, v21

    invoke-static {v3, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 630
    .end local v20    # "keylineGravity":I
    .end local v21    # "keylinePos":I
    :cond_a5
    :goto_a5
    move/from16 v5, p1

    .line 631
    .local v5, "childWidthMeasureSpec":I
    move/from16 v7, p2

    .line 632
    .local v7, "childHeightMeasureSpec":I
    if-eqz v9, :cond_e3

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v3

    if-nez v3, :cond_e3

    .line 635
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v3}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetLeft()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v8}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetRight()I

    move-result v8

    add-int v17, v3, v8

    .line 637
    .local v17, "horizInsets":I
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v3}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v3

    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/support/design/widget/CoordinatorLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v8}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetBottom()I

    move-result v8

    add-int v28, v3, v8

    .line 640
    .local v28, "vertInsets":I
    sub-int v3, v32, v17

    move/from16 v0, v30

    invoke-static {v3, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 642
    sub-int v3, v15, v28

    invoke-static {v3, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 646
    .end local v17    # "horizInsets":I
    .end local v28    # "vertInsets":I
    :cond_e3
    invoke-virtual/range {v23 .. v23}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v2

    .line 647
    .local v2, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v2, :cond_f2

    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v2 .. v8}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onMeasureChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;IIII)Z

    move-result v3

    if-nez v3, :cond_f8

    .line 649
    :cond_f2
    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Landroid/support/design/widget/CoordinatorLayout;->onMeasureChild(Landroid/view/View;IIII)V

    .line 653
    :cond_f8
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    add-int v3, v3, v31

    move-object/from16 v0, v23

    iget v8, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->leftMargin:I

    add-int/2addr v3, v8

    move-object/from16 v0, v23

    iget v8, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->rightMargin:I

    add-int/2addr v3, v8

    move/from16 v0, v33

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v33

    .line 656
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v3, v14

    move-object/from16 v0, v23

    iget v8, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->topMargin:I

    add-int/2addr v3, v8

    move-object/from16 v0, v23

    iget v8, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v3, v8

    move/from16 v0, v16

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 658
    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getMeasuredState(Landroid/view/View;)I

    move-result v3

    invoke-static {v11, v3}, Landroid/support/v4/view/ViewCompat;->combineMeasuredStates(II)I

    move-result v11

    .line 611
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_55

    .line 596
    .end local v2    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "childWidthMeasureSpec":I
    .end local v6    # "keylineWidthUsed":I
    .end local v7    # "childHeightMeasureSpec":I
    .end local v9    # "applyInsets":Z
    .end local v10    # "childCount":I
    .end local v11    # "childState":I
    .end local v13    # "heightMode":I
    .end local v14    # "heightPadding":I
    .end local v15    # "heightSize":I
    .end local v16    # "heightUsed":I
    .end local v18    # "i":I
    .end local v19    # "isRtl":Z
    .end local v23    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v30    # "widthMode":I
    .end local v31    # "widthPadding":I
    .end local v32    # "widthSize":I
    .end local v33    # "widthUsed":I
    :cond_12f
    const/16 v19, 0x0

    goto/16 :goto_21

    .line 608
    .restart local v11    # "childState":I
    .restart local v13    # "heightMode":I
    .restart local v14    # "heightPadding":I
    .restart local v15    # "heightSize":I
    .restart local v16    # "heightUsed":I
    .restart local v19    # "isRtl":Z
    .restart local v30    # "widthMode":I
    .restart local v31    # "widthPadding":I
    .restart local v32    # "widthSize":I
    .restart local v33    # "widthUsed":I
    :cond_133
    const/4 v9, 0x0

    goto/16 :goto_4b

    .line 624
    .restart local v4    # "child":Landroid/view/View;
    .restart local v6    # "keylineWidthUsed":I
    .restart local v9    # "applyInsets":Z
    .restart local v10    # "childCount":I
    .restart local v18    # "i":I
    .restart local v20    # "keylineGravity":I
    .restart local v21    # "keylinePos":I
    .restart local v23    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_136
    const/4 v3, 0x5

    move/from16 v0, v20

    if-ne v0, v3, :cond_13d

    if-eqz v19, :cond_144

    :cond_13d
    const/4 v3, 0x3

    move/from16 v0, v20

    if-ne v0, v3, :cond_a5

    if-eqz v19, :cond_a5

    .line 626
    :cond_144
    const/4 v3, 0x0

    sub-int v8, v21, v25

    invoke-static {v3, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    goto/16 :goto_a5

    .line 662
    .end local v4    # "child":Landroid/view/View;
    .end local v6    # "keylineWidthUsed":I
    .end local v20    # "keylineGravity":I
    .end local v21    # "keylinePos":I
    .end local v23    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_14d
    const/high16 v3, -0x1000000

    and-int/2addr v3, v11

    move/from16 v0, v33

    move/from16 v1, p1

    invoke-static {v0, v1, v3}, Landroid/support/v4/view/ViewCompat;->resolveSizeAndState(III)I

    move-result v29

    .line 664
    .local v29, "width":I
    shl-int/lit8 v3, v11, 0x10

    move/from16 v0, v16

    move/from16 v1, p2

    invoke-static {v0, v1, v3}, Landroid/support/v4/view/ViewCompat;->resolveSizeAndState(III)I

    move-result v12

    .line 666
    .local v12, "height":I
    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1, v12}, Landroid/support/design/widget/CoordinatorLayout;->setMeasuredDimension(II)V

    .line 667
    return-void
.end method

.method public onMeasureChild(Landroid/view/View;IIII)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentWidthMeasureSpec"    # I
    .param p3, "widthUsed"    # I
    .param p4, "parentHeightMeasureSpec"    # I
    .param p5, "heightUsed"    # I

    .prologue
    .line 582
    invoke-virtual/range {p0 .. p5}, Landroid/support/design/widget/CoordinatorLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 584
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .registers 16
    .param p1, "target"    # Landroid/view/View;
    .param p2, "velocityX"    # F
    .param p3, "velocityY"    # F
    .param p4, "consumed"    # Z

    .prologue
    .line 1497
    const/4 v8, 0x0

    .line 1499
    .local v8, "handled":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v7

    .line 1500
    .local v7, "childCount":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_6
    if-ge v9, v7, :cond_2c

    .line 1501
    invoke-virtual {p0, v9}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1502
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1503
    .local v10, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v10}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 1500
    :cond_18
    :goto_18
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 1507
    :cond_1b
    invoke-virtual {v10}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1508
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_18

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    .line 1509
    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FFZ)Z

    move-result v1

    or-int/2addr v8, v1

    goto :goto_18

    .line 1513
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v10    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_2c
    if-eqz v8, :cond_32

    .line 1514
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->dispatchOnDependentViewChanged(Z)V

    .line 1516
    :cond_32
    return v8
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .registers 14
    .param p1, "target"    # Landroid/view/View;
    .param p2, "velocityX"    # F
    .param p3, "velocityY"    # F

    .prologue
    .line 1520
    const/4 v7, 0x0

    .line 1522
    .local v7, "handled":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v6

    .line 1523
    .local v6, "childCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_6
    if-ge v8, v6, :cond_2b

    .line 1524
    invoke-virtual {p0, v8}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1525
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1526
    .local v9, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v9}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 1523
    :cond_18
    :goto_18
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 1530
    :cond_1b
    invoke-virtual {v9}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1531
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_18

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    .line 1532
    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onNestedPreFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z

    move-result v1

    or-int/2addr v7, v1

    goto :goto_18

    .line 1535
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v9    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_2b
    return v7
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .registers 18
    .param p1, "target"    # Landroid/view/View;
    .param p2, "dx"    # I
    .param p3, "dy"    # I
    .param p4, "consumed"    # [I

    .prologue
    .line 1462
    const/4 v11, 0x0

    .line 1463
    .local v11, "xConsumed":I
    const/4 v12, 0x0

    .line 1464
    .local v12, "yConsumed":I
    const/4 v7, 0x0

    .line 1466
    .local v7, "accepted":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v8

    .line 1467
    .local v8, "childCount":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_8
    if-ge v9, v8, :cond_64

    .line 1468
    invoke-virtual {p0, v9}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1469
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1470
    .local v10, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v10}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v1

    if-nez v1, :cond_1d

    .line 1467
    :cond_1a
    :goto_1a
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    .line 1474
    :cond_1d
    invoke-virtual {v10}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1475
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_1a

    .line 1476
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v3, 0x0

    iget-object v4, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput v6, v4, v5

    aput v6, v1, v3

    .line 1477
    iget-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move/from16 v5, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[I)V

    .line 1479
    if-lez p2, :cond_50

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v3, 0x0

    aget v1, v1, v3

    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 1481
    :goto_43
    if-lez p3, :cond_5a

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 1484
    :goto_4e
    const/4 v7, 0x1

    goto :goto_1a

    .line 1479
    :cond_50
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v3, 0x0

    aget v1, v1, v3

    invoke-static {v11, v1}, Ljava/lang/Math;->min(II)I

    move-result v11

    goto :goto_43

    .line 1481
    :cond_5a
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mTempIntPair:[I

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-static {v12, v1}, Ljava/lang/Math;->min(II)I

    move-result v12

    goto :goto_4e

    .line 1488
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v10    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_64
    const/4 v1, 0x0

    aput v11, p4, v1

    .line 1489
    const/4 v1, 0x1

    aput v12, p4, v1

    .line 1491
    if-eqz v7, :cond_70

    .line 1492
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->dispatchOnDependentViewChanged(Z)V

    .line 1494
    :cond_70
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .registers 18
    .param p1, "target"    # Landroid/view/View;
    .param p2, "dxConsumed"    # I
    .param p3, "dyConsumed"    # I
    .param p4, "dxUnconsumed"    # I
    .param p5, "dyUnconsumed"    # I

    .prologue
    .line 1438
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v9

    .line 1439
    .local v9, "childCount":I
    const/4 v8, 0x0

    .line 1441
    .local v8, "accepted":Z
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_6
    if-ge v10, v9, :cond_2e

    .line 1442
    invoke-virtual {p0, v10}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1443
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1444
    .local v11, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v11}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 1441
    :cond_18
    :goto_18
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 1448
    :cond_1b
    invoke-virtual {v11}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1449
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_18

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    .line 1450
    invoke-virtual/range {v0 .. v7}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIII)V

    .line 1452
    const/4 v8, 0x1

    goto :goto_18

    .line 1456
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v11    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_2e
    if-eqz v8, :cond_34

    .line 1457
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->dispatchOnDependentViewChanged(Z)V

    .line 1459
    :cond_34
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 13
    .param p1, "child"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "nestedScrollAxes"    # I

    .prologue
    .line 1394
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingParentHelper:Landroid/support/v4/view/NestedScrollingParentHelper;

    invoke-virtual {v1, p1, p2, p3}, Landroid/support/v4/view/NestedScrollingParentHelper;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    .line 1395
    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingDirectChild:Landroid/view/View;

    .line 1396
    iput-object p2, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingTarget:Landroid/view/View;

    .line 1398
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v6

    .line 1399
    .local v6, "childCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_e
    if-ge v7, v6, :cond_31

    .line 1400
    invoke-virtual {p0, v7}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1401
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1402
    .local v8, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v8}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v1

    if-nez v1, :cond_23

    .line 1399
    :cond_20
    :goto_20
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 1406
    :cond_23
    invoke-virtual {v8}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1407
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_20

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    .line 1408
    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onNestedScrollAccepted(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)V

    goto :goto_20

    .line 1411
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v8    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_31
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 12
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 2518
    move-object v8, p1

    check-cast v8, Landroid/support/design/widget/CoordinatorLayout$SavedState;

    .line 2519
    .local v8, "ss":Landroid/support/design/widget/CoordinatorLayout$SavedState;
    invoke-virtual {v8}, Landroid/support/design/widget/CoordinatorLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v9

    invoke-super {p0, v9}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 2521
    iget-object v1, v8, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    .line 2523
    .local v1, "behaviorStates":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v4

    .local v4, "count":I
    :goto_11
    if-ge v5, v4, :cond_36

    .line 2524
    invoke-virtual {p0, v5}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2525
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    .line 2526
    .local v3, "childId":I
    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getResolvedLayoutParams(Landroid/view/View;)Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v6

    .line 2527
    .local v6, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v6}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 2529
    .local v0, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    const/4 v9, -0x1

    if-eq v3, v9, :cond_33

    if-eqz v0, :cond_33

    .line 2530
    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/Parcelable;

    .line 2531
    .local v7, "savedState":Landroid/os/Parcelable;
    if-eqz v7, :cond_33

    .line 2532
    invoke-virtual {v0, p0, v2, v7}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 2523
    .end local v7    # "savedState":Landroid/os/Parcelable;
    :cond_33
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    .line 2536
    .end local v0    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "childId":I
    .end local v6    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_36
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 11

    .prologue
    .line 2540
    new-instance v7, Landroid/support/design/widget/CoordinatorLayout$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v9

    invoke-direct {v7, v9}, Landroid/support/design/widget/CoordinatorLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 2542
    .local v7, "ss":Landroid/support/design/widget/CoordinatorLayout$SavedState;
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 2543
    .local v1, "behaviorStates":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/os/Parcelable;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v4

    .local v4, "count":I
    :goto_13
    if-ge v5, v4, :cond_38

    .line 2544
    invoke-virtual {p0, v5}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2545
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    .line 2546
    .local v3, "childId":I
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 2547
    .local v6, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v6}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 2549
    .local v0, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    const/4 v9, -0x1

    if-eq v3, v9, :cond_35

    if-eqz v0, :cond_35

    .line 2551
    invoke-virtual {v0, p0, v2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object v8

    .line 2552
    .local v8, "state":Landroid/os/Parcelable;
    if-eqz v8, :cond_35

    .line 2553
    invoke-virtual {v1, v3, v8}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 2543
    .end local v8    # "state":Landroid/os/Parcelable;
    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_13

    .line 2557
    .end local v0    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "childId":I
    .end local v6    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_38
    iput-object v1, v7, Landroid/support/design/widget/CoordinatorLayout$SavedState;->behaviorStates:Landroid/util/SparseArray;

    .line 2558
    return-object v7
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .registers 15
    .param p1, "child"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "nestedScrollAxes"    # I

    .prologue
    .line 1373
    const/4 v8, 0x0

    .line 1375
    .local v8, "handled":Z
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v7

    .line 1376
    .local v7, "childCount":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_6
    if-ge v9, v7, :cond_2c

    .line 1377
    invoke-virtual {p0, v9}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1378
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1379
    .local v10, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v10}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 1380
    .local v0, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_27

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    .line 1381
    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)Z

    move-result v6

    .line 1383
    .local v6, "accepted":Z
    or-int/2addr v8, v6

    .line 1385
    invoke-virtual {v10, v6}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->acceptNestedScroll(Z)V

    .line 1376
    .end local v6    # "accepted":Z
    :goto_24
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 1387
    :cond_27
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->acceptNestedScroll(Z)V

    goto :goto_24

    .line 1390
    .end local v0    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v2    # "view":Landroid/view/View;
    .end local v10    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_2c
    return v8
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 9
    .param p1, "target"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 1414
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingParentHelper:Landroid/support/v4/view/NestedScrollingParentHelper;

    invoke-virtual {v5, p1}, Landroid/support/v4/view/NestedScrollingParentHelper;->onStopNestedScroll(Landroid/view/View;)V

    .line 1416
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    .line 1417
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    if-ge v1, v0, :cond_30

    .line 1418
    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1419
    .local v3, "view":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 1420
    .local v2, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->isNestedScrollAccepted()Z

    move-result v5

    if-nez v5, :cond_20

    .line 1417
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1424
    :cond_20
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    .line 1425
    .local v4, "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v4, :cond_29

    .line 1426
    invoke-virtual {v4, p0, v3, p1}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V

    .line 1428
    :cond_29
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->resetNestedScroll()V

    .line 1429
    invoke-virtual {v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->resetChangedAfterNestedScroll()V

    goto :goto_1d

    .line 1432
    .end local v2    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v3    # "view":Landroid/view/View;
    .end local v4    # "viewBehavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    :cond_30
    iput-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingDirectChild:Landroid/view/View;

    .line 1433
    iput-object v6, p0, Landroid/support/design/widget/CoordinatorLayout;->mNestedScrollingTarget:Landroid/view/View;

    .line 1434
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 16
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x3

    const/4 v5, 0x0

    .line 400
    const/4 v12, 0x0

    .line 401
    .local v12, "handled":Z
    const/4 v11, 0x0

    .line 402
    .local v11, "cancelSuper":Z
    const/4 v10, 0x0

    .line 404
    .local v10, "cancelEvent":Landroid/view/MotionEvent;
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v8

    .line 406
    .local v8, "action":I
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    if-nez v2, :cond_13

    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->performIntercept(Landroid/view/MotionEvent;)Z

    move-result v11

    if-eqz v11, :cond_26

    .line 409
    :cond_13
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 410
    .local v13, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v13}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v9

    .line 411
    .local v9, "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v9, :cond_26

    .line 412
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    invoke-virtual {v9, p0, v2, p1}, Landroid/support/design/widget/CoordinatorLayout$Behavior;->onTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 417
    .end local v9    # "b":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    .end local v13    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :cond_26
    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->mBehaviorTouchView:Landroid/view/View;

    if-nez v2, :cond_41

    .line 418
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v12, v2

    .line 428
    :cond_2f
    :goto_2f
    if-nez v12, :cond_33

    if-nez v8, :cond_33

    .line 432
    :cond_33
    if-eqz v10, :cond_38

    .line 433
    invoke-virtual {v10}, Landroid/view/MotionEvent;->recycle()V

    .line 436
    :cond_38
    const/4 v2, 0x1

    if-eq v8, v2, :cond_3d

    if-ne v8, v4, :cond_40

    .line 437
    :cond_3d
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 440
    :cond_40
    return v12

    .line 419
    :cond_41
    if-eqz v11, :cond_2f

    .line 420
    if-eqz v10, :cond_50

    .line 421
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 422
    .local v0, "now":J
    const/4 v7, 0x0

    move-wide v2, v0

    move v6, v5

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .line 425
    .end local v0    # "now":J
    :cond_50
    invoke-super {p0, v10}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2f
.end method

.method recordLastChildRect(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "r"    # Landroid/graphics/Rect;

    .prologue
    .line 761
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 762
    .local v0, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v0, p2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setLastChildRect(Landroid/graphics/Rect;)V

    .line 763
    return-void
.end method

.method removePreDrawListener()V
    .registers 3

    .prologue
    .line 1263
    iget-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    if-eqz v1, :cond_11

    .line 1264
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    if-eqz v1, :cond_11

    .line 1265
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1266
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnPreDrawListener:Landroid/support/design/widget/CoordinatorLayout$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1269
    .end local v0    # "vto":Landroid/view/ViewTreeObserver;
    :cond_11
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->mNeedsPreDrawListener:Z

    .line 1270
    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2
    .param p1, "disallowIntercept"    # Z

    .prologue
    .line 445
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 446
    if-eqz p1, :cond_8

    .line 447
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->resetTouchBehaviors()V

    .line 449
    :cond_8
    return-void
.end method

.method public setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .registers 2
    .param p1, "onHierarchyChangeListener"    # Landroid/view/ViewGroup$OnHierarchyChangeListener;

    .prologue
    .line 191
    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnHierarchyChangeListener:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    .line 192
    return-void
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "bg"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 229
    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->mStatusBarBackground:Landroid/graphics/drawable/Drawable;

    .line 230
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->invalidate()V

    .line 231
    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 260
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    .line 261
    return-void
.end method

.method public setStatusBarBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 249
    if-eqz p1, :cond_e

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_a
    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    .line 250
    return-void

    .line 249
    :cond_e
    const/4 v0, 0x0

    goto :goto_a
.end method
