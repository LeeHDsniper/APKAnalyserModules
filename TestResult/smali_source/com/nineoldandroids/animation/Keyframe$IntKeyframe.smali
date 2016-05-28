.class Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;
.super Lcom/nineoldandroids/animation/Keyframe;
.source "Keyframe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/Keyframe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntKeyframe"
.end annotation


# instance fields
.field mValue:I


# direct methods
.method constructor <init>(F)V
    .registers 3
    .param p1, "fraction"    # F

    .prologue
    .line 289
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Keyframe;-><init>()V

    .line 290
    iput p1, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mFraction:F

    .line 291
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValueType:Ljava/lang/Class;

    .line 292
    return-void
.end method

.method constructor <init>(FI)V
    .registers 4
    .param p1, "fraction"    # F
    .param p2, "value"    # I

    .prologue
    .line 282
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Keyframe;-><init>()V

    .line 283
    iput p1, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mFraction:F

    .line 284
    iput p2, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValue:I

    .line 285
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValueType:Ljava/lang/Class;

    .line 286
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mHasValue:Z

    .line 287
    return-void
.end method


# virtual methods
.method public clone()Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;
    .registers 4

    .prologue
    .line 311
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->getFraction()F

    move-result v1

    iget v2, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValue:I

    invoke-direct {v0, v1, v2}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;-><init>(FI)V

    .line 312
    .local v0, "kfClone":Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 313
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/Keyframe;
    .registers 2

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->clone()Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

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
    .line 275
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->clone()Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    move-result-object v0

    return-object v0
.end method

.method public getIntValue()I
    .registers 2

    .prologue
    .line 295
    iget v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValue:I

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 299
    iget v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValue:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 303
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Integer;

    if-ne v0, v1, :cond_15

    .line 304
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mValue:I

    .line 305
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;->mHasValue:Z

    .line 307
    :cond_15
    return-void
.end method
