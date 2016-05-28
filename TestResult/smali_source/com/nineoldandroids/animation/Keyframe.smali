.class public abstract Lcom/nineoldandroids/animation/Keyframe;
.super Ljava/lang/Object;
.source "Keyframe.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;,
        Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;,
        Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;
    }
.end annotation


# instance fields
.field mFraction:F

.field mHasValue:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field mValueType:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nineoldandroids/animation/Keyframe;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe;->mHasValue:Z

    .line 320
    return-void
.end method

.method public static ofFloat(F)Lcom/nineoldandroids/animation/Keyframe;
    .registers 2
    .param p0, "fraction"    # F

    .prologue
    .line 124
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    invoke-direct {v0, p0}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;-><init>(F)V

    return-object v0
.end method

.method public static ofFloat(FF)Lcom/nineoldandroids/animation/Keyframe;
    .registers 3
    .param p0, "fraction"    # F
    .param p1, "value"    # F

    .prologue
    .line 108
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;-><init>(FF)V

    return-object v0
.end method

.method public static ofInt(F)Lcom/nineoldandroids/animation/Keyframe;
    .registers 2
    .param p0, "fraction"    # F

    .prologue
    .line 92
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    invoke-direct {v0, p0}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;-><init>(F)V

    return-object v0
.end method

.method public static ofInt(FI)Lcom/nineoldandroids/animation/Keyframe;
    .registers 3
    .param p0, "fraction"    # F
    .param p1, "value"    # I

    .prologue
    .line 76
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;-><init>(FI)V

    return-object v0
.end method

.method public static ofObject(F)Lcom/nineoldandroids/animation/Keyframe;
    .registers 3
    .param p0, "fraction"    # F

    .prologue
    .line 156
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;-><init>(FLjava/lang/Object;)V

    return-object v0
.end method

.method public static ofObject(FLjava/lang/Object;)Lcom/nineoldandroids/animation/Keyframe;
    .registers 3
    .param p0, "fraction"    # F
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 140
    new-instance v0, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;-><init>(FLjava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public abstract clone()Lcom/nineoldandroids/animation/Keyframe;
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Keyframe;->clone()Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v0

    return-object v0
.end method

.method public getFraction()F
    .registers 2

    .prologue
    .line 191
    iget v0, p0, Lcom/nineoldandroids/animation/Keyframe;->mFraction:F

    return v0
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/nineoldandroids/animation/Keyframe;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public abstract getValue()Ljava/lang/Object;
.end method

.method public hasValue()Z
    .registers 2

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/nineoldandroids/animation/Keyframe;->mHasValue:Z

    return v0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/nineoldandroids/animation/Keyframe;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 222
    return-void
.end method

.method public abstract setValue(Ljava/lang/Object;)V
.end method
