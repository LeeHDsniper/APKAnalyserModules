.class Lcom/localytics/android/TestModeButton$TestModeDialog;
.super Landroid/app/Dialog;
.source "TestModeButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/TestModeButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TestModeDialog"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/TestModeButton$TestModeDialog$Button;
    }
.end annotation


# instance fields
.field private mAnimIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimOut:Landroid/view/animation/TranslateAnimation;

.field private mDialogLayout:Landroid/widget/RelativeLayout;

.field private mMetrics:Landroid/util/DisplayMetrics;

.field final synthetic this$0:Lcom/localytics/android/TestModeButton;


# direct methods
.method public constructor <init>(Lcom/localytics/android/TestModeButton;Landroid/content/Context;I)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "theme"    # I

    .prologue
    .line 276
    iput-object p1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    .line 277
    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 279
    invoke-direct {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->setupViews()V

    .line 280
    invoke-direct {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->createAnimations()V

    .line 281
    invoke-direct {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->adjustLayout()V

    .line 282
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/TestModeButton$TestModeDialog;)Landroid/view/animation/TranslateAnimation;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/TestModeButton$TestModeDialog;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method static synthetic access$100(Lcom/localytics/android/TestModeButton$TestModeDialog;)Landroid/widget/RelativeLayout;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/TestModeButton$TestModeDialog;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method private adjustLayout()V
    .registers 11
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v9, 0x400

    const/16 v8, 0x20

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 320
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v3, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    .line 321
    iget-object v3, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    invoke-virtual {v3}, Lcom/localytics/android/TestModeButton;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 322
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    iget-object v4, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v3, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 327
    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 328
    .local v1, "window":Landroid/view/Window;
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 329
    const/16 v3, 0x33

    invoke-virtual {v1, v3}, Landroid/view/Window;->setGravity(I)V

    .line 330
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 331
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    iget-object v3, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-static {v7, v5, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 332
    const/high16 v3, 0x42aa0000

    iget-object v4, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-static {v7, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 333
    iput v5, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 334
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 335
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 336
    invoke-virtual {v1, v8, v8}, Landroid/view/Window;->setFlags(II)V

    .line 338
    iget-object v3, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    # getter for: Lcom/localytics/android/TestModeButton;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v3}, Lcom/localytics/android/TestModeButton;->access$300(Lcom/localytics/android/TestModeButton;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-eqz v3, :cond_6d

    .line 340
    iget-object v3, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 344
    :cond_6d
    invoke-virtual {v1, v9, v9}, Landroid/view/Window;->setFlags(II)V

    .line 345
    return-void
.end method

.method private createAnimations()V
    .registers 10

    .prologue
    .line 352
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/high16 v2, -0x40800000

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    .line 353
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 354
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/high16 v4, -0x40800000

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    .line 355
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 356
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Lcom/localytics/android/TestModeButton$TestModeDialog$2;

    invoke-direct {v1, p0}, Lcom/localytics/android/TestModeButton$TestModeDialog$2;-><init>(Lcom/localytics/android/TestModeButton$TestModeDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 364
    return-void
.end method

.method private setupViews()V
    .registers 6

    .prologue
    const/4 v4, -0x2

    .line 287
    new-instance v2, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    .line 288
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 289
    .local v1, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 290
    iget-object v2, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    new-instance v0, Lcom/localytics/android/TestModeButton$TestModeDialog$Button;

    invoke-virtual {p0}, Lcom/localytics/android/TestModeButton$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, p0, v2, v3}, Lcom/localytics/android/TestModeButton$TestModeDialog$Button;-><init>(Lcom/localytics/android/TestModeButton$TestModeDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 294
    .local v0, "button":Lcom/localytics/android/TestModeButton$TestModeDialog$Button;
    new-instance v2, Lcom/localytics/android/TestModeButton$TestModeDialog$1;

    invoke-direct {v2, p0}, Lcom/localytics/android/TestModeButton$TestModeDialog$1;-><init>(Lcom/localytics/android/TestModeButton$TestModeDialog;)V

    invoke-virtual {v0, v2}, Lcom/localytics/android/TestModeButton$TestModeDialog$Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 309
    iget-object v2, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 311
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/localytics/android/TestModeButton$TestModeDialog;->requestWindowFeature(I)Z

    .line 313
    iget-object v2, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v2}, Lcom/localytics/android/TestModeButton$TestModeDialog;->setContentView(Landroid/view/View;)V

    .line 314
    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 369
    const/4 v0, 0x4

    if-ne p1, v0, :cond_a

    .line 371
    iget-object v0, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 373
    :cond_a
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
