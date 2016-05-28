.class public Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "DrawShadowRelativeLayout.java"


# static fields
.field private static SHADOW_ALPHA:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAlpha:F

.field private mAnimator:Landroid/animation/ObjectAnimator;

.field private mHeight:I

.field private final mShadowAtBottom:Z

.field private mShadowDrawable:Landroid/graphics/drawable/Drawable;

.field private mShadowNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;

.field private mShadowTopOffset:I

.field private mShadowVisible:Z

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 144
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout$1;

    const-class v1, Ljava/lang/Float;

    const-string v2, "shadowAlpha"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->SHADOW_ALPHA:Landroid/util/Property;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    const/high16 v1, 0x3f800000

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F

    .line 54
    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/R$styleable;->DrawShadowFrameLayout:[I

    invoke-virtual {p1, p2, v1, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 57
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$styleable;->DrawShadowFrameLayout_shadowVisible:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    .line 58
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$styleable;->DrawShadowFrameLayout_shadowBottom:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowAtBottom:Z

    .line 59
    sget v1, Lcom/adobe/creativesdk/foundation/auth/R$styleable;->DrawShadowFrameLayout_shadowDrawable:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    .line 61
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_3b

    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    if-eqz v1, :cond_3b

    .line 63
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v4, Lcom/adobe/creativesdk/foundation/auth/R$drawable;->drop_shadow:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    .line 66
    :cond_3b
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_50

    .line 67
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 68
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v1, v1, Landroid/graphics/drawable/NinePatchDrawable;

    if-eqz v1, :cond_50

    .line 69
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/NinePatchDrawable;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;

    .line 74
    :cond_50
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    if-nez v1, :cond_5c

    move v1, v2

    :goto_55
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setWillNotDraw(Z)V

    .line 76
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 77
    return-void

    :cond_5c
    move v1, v3

    .line 74
    goto :goto_55
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    .prologue
    .line 34
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F

    return v0
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;F)F
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;
    .param p1, "x1"    # F

    .prologue
    .line 34
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F

    return p1
.end method

.method private updateShadowBounds()V
    .registers 6

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_10

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowTopOffset:I

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mWidth:I

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 94
    :cond_10
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 99
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->draw(Landroid/graphics/Canvas;)V

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_23

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    if-eqz v0, :cond_23

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;

    if-eqz v0, :cond_1e

    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/NinePatchDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    const/high16 v1, 0x437f0000

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 115
    :cond_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 117
    :cond_23
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 81
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->onSizeChanged(IIII)V

    .line 82
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mWidth:I

    .line 83
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mHeight:I

    .line 84
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowAtBottom:Z

    if-eqz v0, :cond_f

    .line 85
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mHeight:I

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowTopOffset:I

    .line 87
    :cond_f
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->updateShadowBounds()V

    .line 88
    return-void
.end method

.method public setShadowTopOffset(I)V
    .registers 2
    .param p1, "shadowTopOffset"    # I

    .prologue
    .line 120
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowTopOffset:I

    .line 121
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->updateShadowBounds()V

    .line 122
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 123
    return-void
.end method

.method public setShadowVisible(ZZ)V
    .registers 11
    .param p1, "shadowVisible"    # Z
    .param p2, "animate"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/high16 v2, 0x3f800000

    const/4 v1, 0x0

    .line 126
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_13

    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 129
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    .line 132
    :cond_13
    if-eqz p2, :cond_39

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_39

    .line 133
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->SHADOW_ALPHA:Landroid/util/Property;

    const/4 v0, 0x2

    new-array v6, v0, [F

    if-eqz p1, :cond_45

    move v0, v1

    :goto_21
    aput v0, v6, v4

    if-eqz p1, :cond_47

    :goto_25
    aput v2, v6, v3

    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v6, 0x3e8

    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 140
    :cond_39
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 141
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mShadowVisible:Z

    if-nez v0, :cond_49

    move v0, v3

    :goto_41
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setWillNotDraw(Z)V

    .line 142
    return-void

    :cond_45
    move v0, v2

    .line 133
    goto :goto_21

    :cond_47
    move v2, v1

    goto :goto_25

    :cond_49
    move v0, v4

    .line 141
    goto :goto_41
.end method
