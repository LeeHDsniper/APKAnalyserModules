.class Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
.super Lcom/nineoldandroids/animation/Keyframe;
.source "Keyframe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/Keyframe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FloatKeyframe"
.end annotation


# instance fields
.field mValue:F


# direct methods
.method constructor <init>(F)V
    .registers 3
    .param p1, "fraction"    # F

    .prologue
    .line 333
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Keyframe;-><init>()V

    .line 334
    iput p1, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mFraction:F

    .line 335
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValueType:Ljava/lang/Class;

    .line 336
    return-void
.end method

.method constructor <init>(FF)V
    .registers 4
    .param p1, "fraction"    # F
    .param p2, "value"    # F

    .prologue
    .line 326
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Keyframe;-><init>()V

    .line 327
    iput p1, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mFraction:F

    .line 328
    iput p2, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValue:F

    .line 329
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValueType:Ljava/lang/Class;

    .line 330
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mHasValue:Z

    .line 331
    return-void
.end method


# virtual methods
.method public clone()Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    .registers 4

    .prologue
    .line 355
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v1

    iget v2, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValue:F

    invoke-direct {v0, v1, v2}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;-><init>(FF)V

    .line 356
    .local v0, "kfClone":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 357
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/Keyframe;
    .registers 2

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->clone()Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->clone()Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    move-result-object v0

    return-object v0
.end method

.method public getFloatValue()F
    .registers 2

    .prologue
    .line 339
    iget v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValue:F

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 343
    iget v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValue:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 347
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Float;

    if-ne v0, v1, :cond_15

    .line 348
    check-cast p1, Ljava/lang/Float;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mValue:F

    .line 349
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->mHasValue:Z

    .line 351
    :cond_15
    return-void
.end method
