.class Lcom/localytics/android/AmpDialogFragment$AmpDialog;
.super Landroid/app/Dialog;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/AmpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AmpDialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;,
        Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;
    }
.end annotation


# instance fields
.field private mAnimBottomIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimBottomOut:Landroid/view/animation/TranslateAnimation;

.field private mAnimCenterIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimCenterOut:Landroid/view/animation/TranslateAnimation;

.field private mAnimFullIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimFullOut:Landroid/view/animation/TranslateAnimation;

.field private mAnimTopIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimTopOut:Landroid/view/animation/TranslateAnimation;

.field private mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

.field private mDialogLayout:Landroid/widget/RelativeLayout;

.field private mHeight:F

.field private mLocation:Ljava/lang/String;

.field private mMetrics:Landroid/util/DisplayMetrics;

.field private mRootLayout:Landroid/widget/RelativeLayout;

.field private mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

.field private mWidth:F

.field final synthetic this$0:Lcom/localytics/android/AmpDialogFragment;


# direct methods
.method public constructor <init>(Lcom/localytics/android/AmpDialogFragment;Landroid/content/Context;I)V
    .registers 7
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "theme"    # I

    .prologue
    .line 567
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    .line 568
    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 571
    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {p1}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v1

    if-nez v1, :cond_f

    .line 573
    invoke-virtual {p1}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    .line 592
    :cond_e
    :goto_e
    return-void

    .line 576
    :cond_f
    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {p1}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "location"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mLocation:Ljava/lang/String;

    .line 578
    invoke-direct {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->setupViews()V

    .line 579
    invoke-direct {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->createAnimations()V

    .line 580
    invoke-direct {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->adjustLayout()V

    .line 587
    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {p1}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "html_url"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 588
    .local v0, "htmlUrl":Ljava/lang/String;
    if-eqz v0, :cond_e

    .line 590
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {v1, v0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_e
.end method

.method static synthetic access$100(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    .prologue
    .line 476
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)Landroid/util/DisplayMetrics;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    .prologue
    .line 476
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    return-object v0
.end method

.method static synthetic access$700(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)F
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    .prologue
    .line 476
    iget v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F

    return v0
.end method

.method static synthetic access$800(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)F
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    .prologue
    .line 476
    iget v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mHeight:F

    return v0
.end method

.method private adjustLayout()V
    .registers 16
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v14, 0x400

    const/16 v13, 0x20

    const/4 v12, 0x0

    const/4 v11, 0x0

    const/high16 v10, 0x3f000000

    .line 663
    new-instance v7, Landroid/util/DisplayMetrics;

    invoke-direct {v7}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    .line 664
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    invoke-virtual {v7}, Lcom/localytics/android/AmpDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-string v8, "window"

    invoke-virtual {v7, v8}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    .line 665
    .local v6, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v7, v8}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 668
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v7

    const-string v8, "display_width"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    iput v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F

    .line 669
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v7

    const-string v8, "display_height"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    iput v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mHeight:F

    .line 672
    iget v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mHeight:F

    iget v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F

    div-float v0, v7, v8

    .line 673
    .local v0, "aspectRatio":F
    const/high16 v7, 0x43b40000

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v9, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v9, v9, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    int-to-float v8, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 678
    .local v3, "maxWidth":F
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    .line 679
    .local v5, "window":Landroid/view/Window;
    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 681
    .local v1, "attributes":Landroid/view/WindowManager$LayoutParams;
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7, v12}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v5, v7}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 682
    invoke-virtual {v5, v13, v13}, Landroid/view/Window;->setFlags(II)V

    .line 685
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mLocation:Ljava/lang/String;

    const-string v8, "center"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f8

    .line 688
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v5, v7, v8}, Landroid/view/Window;->setLayout(II)V

    .line 690
    const/high16 v7, 0x41200000

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v10

    float-to-int v2, v7

    .line 691
    .local v2, "margin":I
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 692
    .local v4, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    shl-int/lit8 v7, v2, 0x1

    int-to-float v7, v7

    sub-float v7, v3, v7

    iget v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F

    iget-object v9, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v8, v9

    add-float/2addr v8, v10

    float-to-int v8, v8

    int-to-float v8, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    float-to-int v7, v7

    shl-int/lit8 v8, v2, 0x1

    add-int/2addr v7, v8

    iput v7, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 693
    shl-int/lit8 v7, v2, 0x1

    int-to-float v7, v7

    sub-float v7, v3, v7

    iget v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWidth:F

    iget-object v9, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v8, v9

    add-float/2addr v8, v10

    float-to-int v8, v8

    int-to-float v8, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    mul-float/2addr v7, v0

    float-to-int v7, v7

    shl-int/lit8 v8, v2, 0x1

    add-int/2addr v7, v8

    iput v7, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 694
    invoke-virtual {v4, v2, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 695
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {v7, v4}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 696
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->requestLayout()V

    .line 722
    .end local v2    # "margin":I
    .end local v4    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_e5
    :goto_e5
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v7}, Lcom/localytics/android/AmpDialogFragment;->access$400(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v7

    invoke-virtual {v7, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v7

    if-eqz v7, :cond_f4

    .line 724
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->enterWithAnimation()V

    .line 728
    :cond_f4
    invoke-virtual {v5, v14, v14}, Landroid/view/Window;->setFlags(II)V

    .line 729
    return-void

    .line 699
    :cond_f8
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mLocation:Ljava/lang/String;

    const-string v8, "full"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10e

    .line 702
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v5, v7, v8}, Landroid/view/Window;->setLayout(II)V

    goto :goto_e5

    .line 705
    :cond_10e
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mLocation:Ljava/lang/String;

    const-string v8, "top"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_128

    .line 707
    const v7, -0xfffffff

    iput v7, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 708
    iput v11, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 710
    float-to-int v7, v3

    mul-float v8, v3, v0

    add-float/2addr v8, v10

    float-to-int v8, v8

    invoke-virtual {v5, v7, v8}, Landroid/view/Window;->setLayout(II)V

    goto :goto_e5

    .line 713
    :cond_128
    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mLocation:Ljava/lang/String;

    const-string v8, "bottom"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e5

    .line 715
    const v7, 0xfffffff

    iput v7, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 716
    iput v11, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 718
    float-to-int v7, v3

    mul-float v8, v3, v0

    add-float/2addr v8, v10

    float-to-int v8, v8

    invoke-virtual {v5, v7, v8}, Landroid/view/Window;->setLayout(II)V

    goto :goto_e5
.end method

.method private createAnimations()V
    .registers 11

    .prologue
    .line 736
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/high16 v6, 0x3f800000

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterIn:Landroid/view/animation/TranslateAnimation;

    .line 737
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 738
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/high16 v8, 0x3f800000

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterOut:Landroid/view/animation/TranslateAnimation;

    .line 739
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 741
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/high16 v6, -0x40800000

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopIn:Landroid/view/animation/TranslateAnimation;

    .line 742
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 743
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/high16 v8, -0x40800000

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopOut:Landroid/view/animation/TranslateAnimation;

    .line 744
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 746
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/high16 v6, 0x3f800000

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomIn:Landroid/view/animation/TranslateAnimation;

    .line 747
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 748
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/high16 v8, 0x3f800000

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomOut:Landroid/view/animation/TranslateAnimation;

    .line 749
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 751
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/high16 v6, 0x3f800000

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullIn:Landroid/view/animation/TranslateAnimation;

    .line 752
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 753
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/high16 v8, 0x3f800000

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullOut:Landroid/view/animation/TranslateAnimation;

    .line 754
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 756
    new-instance v9, Lcom/localytics/android/AmpDialogFragment$AmpDialog$2;

    invoke-direct {v9, p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$2;-><init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)V

    .line 764
    .local v9, "listenerOut":Landroid/view/animation/Animation$AnimationListener;
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 765
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 766
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 767
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v9}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 768
    return-void
.end method

.method private setupViews()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x2

    .line 621
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    .line 622
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 625
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    .line 626
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 627
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 628
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 629
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 632
    new-instance v1, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, v4}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;-><init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    .line 633
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 636
    new-instance v1, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, v4}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;-><init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    .line 637
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    new-instance v2, Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$1;-><init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;)V

    invoke-virtual {v1, v2}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 647
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 649
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->requestWindowFeature(I)Z

    .line 656
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->setContentView(Landroid/view/View;)V

    .line 657
    return-void
.end method


# virtual methods
.method public dismissWithAnimation()V
    .registers 4

    .prologue
    .line 805
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {v1}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "location"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 808
    .local v0, "location":Ljava/lang/String;
    const-string v1, "center"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 810
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 827
    :cond_1d
    :goto_1d
    return-void

    .line 813
    :cond_1e
    const-string v1, "full"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 815
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d

    .line 818
    :cond_2e
    const-string v1, "top"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 820
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d

    .line 823
    :cond_3e
    const-string v1, "bottom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 825
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d
.end method

.method public enterWithAnimation()V
    .registers 4

    .prologue
    .line 775
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;
    invoke-static {v1}, Lcom/localytics/android/AmpDialogFragment;->access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "location"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 778
    .local v0, "location":Ljava/lang/String;
    const-string v1, "center"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 780
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimCenterIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 797
    :cond_1d
    :goto_1d
    return-void

    .line 783
    :cond_1e
    const-string v1, "full"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 785
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimFullIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d

    .line 788
    :cond_2e
    const-string v1, "top"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 790
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimTopIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d

    .line 793
    :cond_3e
    const-string v1, "bottom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 795
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mRootLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mAnimBottomIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1d
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 597
    const/4 v0, 0x4

    if-ne p1, v0, :cond_15

    .line 599
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->this$0:Lcom/localytics/android/AmpDialogFragment;

    # getter for: Lcom/localytics/android/AmpDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v0}, Lcom/localytics/android/AmpDialogFragment;->access$300(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 601
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->dismissWithAnimation()V

    .line 603
    :cond_13
    const/4 v0, 0x1

    .line 605
    :goto_14
    return v0

    :cond_15
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_14
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 611
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    if-eqz v0, :cond_9

    .line 613
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->mBtnClose:Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;

    invoke-virtual {v0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->release()V

    .line 615
    :cond_9
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 616
    return-void
.end method
