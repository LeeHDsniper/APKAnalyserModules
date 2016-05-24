.class Lcom/nineoldandroids/animation/KeyframeSet;
.super Ljava/lang/Object;
.source "KeyframeSet.java"


# instance fields
.field mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

.field mInterpolator:Landroid/view/animation/Interpolator;

.field mKeyframes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/Keyframe;",
            ">;"
        }
    .end annotation
.end field

.field mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

.field mNumKeyframes:I


# direct methods
.method public varargs constructor <init>([Lcom/nineoldandroids/animation/Keyframe;)V
    .registers 4
    .param p1, "keyframes"    # [Lcom/nineoldandroids/animation/Keyframe;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    array-length v0, p1

    iput v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    .line 47
    iget-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 48
    iget-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/Keyframe;

    iput-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    .line 49
    iget-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    iget v1, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/Keyframe;

    iput-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    .line 50
    iget-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Keyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 51
    return-void
.end method

.method public static varargs ofFloat([F)Lcom/nineoldandroids/animation/KeyframeSet;
    .registers 8
    .param p0, "values"    # [F

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 69
    array-length v2, p0

    .line 70
    .local v2, "numKeyframes":I
    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v1, v3, [Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 71
    .local v1, "keyframes":[Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    if-ne v2, v6, :cond_27

    .line 72
    invoke-static {v5}, Lcom/nineoldandroids/animation/Keyframe;->ofFloat(F)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    aput-object v3, v1, v4

    .line 73
    const/high16 v3, 0x3f800000

    aget v4, p0, v4

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofFloat(FF)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    aput-object v3, v1, v6

    .line 80
    :cond_21
    new-instance v3, Lcom/nineoldandroids/animation/FloatKeyframeSet;

    invoke-direct {v3, v1}, Lcom/nineoldandroids/animation/FloatKeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;)V

    return-object v3

    .line 75
    :cond_27
    aget v3, p0, v4

    invoke-static {v5, v3}, Lcom/nineoldandroids/animation/Keyframe;->ofFloat(FF)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    aput-object v3, v1, v4

    .line 76
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_32
    if-ge v0, v2, :cond_21

    .line 77
    int-to-float v3, v0

    add-int/lit8 v4, v2, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    aget v4, p0, v0

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofFloat(FF)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    aput-object v3, v1, v0

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_32
.end method

.method public static varargs ofInt([I)Lcom/nineoldandroids/animation/KeyframeSet;
    .registers 8
    .param p0, "values"    # [I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 54
    array-length v2, p0

    .line 55
    .local v2, "numKeyframes":I
    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v1, v3, [Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    .line 56
    .local v1, "keyframes":[Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;
    if-ne v2, v6, :cond_27

    .line 57
    invoke-static {v5}, Lcom/nineoldandroids/animation/Keyframe;->ofInt(F)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    aput-object v3, v1, v4

    .line 58
    const/high16 v3, 0x3f800000

    aget v4, p0, v4

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofInt(FI)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    aput-object v3, v1, v6

    .line 65
    :cond_21
    new-instance v3, Lcom/nineoldandroids/animation/IntKeyframeSet;

    invoke-direct {v3, v1}, Lcom/nineoldandroids/animation/IntKeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;)V

    return-object v3

    .line 60
    :cond_27
    aget v3, p0, v4

    invoke-static {v5, v3}, Lcom/nineoldandroids/animation/Keyframe;->ofInt(FI)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    aput-object v3, v1, v4

    .line 61
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_32
    if-ge v0, v2, :cond_21

    .line 62
    int-to-float v3, v0

    add-int/lit8 v4, v2, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    aget v4, p0, v0

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofInt(FI)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$IntKeyframe;

    aput-object v3, v1, v0

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_32
.end method

.method public static varargs ofObject([Ljava/lang/Object;)Lcom/nineoldandroids/animation/KeyframeSet;
    .registers 8
    .param p0, "values"    # [Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 116
    array-length v2, p0

    .line 117
    .local v2, "numKeyframes":I
    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v1, v3, [Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    .line 118
    .local v1, "keyframes":[Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;
    if-ne v2, v6, :cond_27

    .line 119
    invoke-static {v5}, Lcom/nineoldandroids/animation/Keyframe;->ofObject(F)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    aput-object v3, v1, v4

    .line 120
    const/high16 v3, 0x3f800000

    aget-object v4, p0, v4

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofObject(FLjava/lang/Object;)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    aput-object v3, v1, v6

    .line 127
    :cond_21
    new-instance v3, Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-direct {v3, v1}, Lcom/nineoldandroids/animation/KeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe;)V

    return-object v3

    .line 122
    :cond_27
    aget-object v3, p0, v4

    invoke-static {v5, v3}, Lcom/nineoldandroids/animation/Keyframe;->ofObject(FLjava/lang/Object;)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    aput-object v3, v1, v4

    .line 123
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_32
    if-ge v0, v2, :cond_21

    .line 124
    int-to-float v3, v0

    add-int/lit8 v4, v2, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    aget-object v4, p0, v0

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/Keyframe;->ofObject(FLjava/lang/Object;)Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe$ObjectKeyframe;

    aput-object v3, v1, v0

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_32
.end method


# virtual methods
.method public clone()Lcom/nineoldandroids/animation/KeyframeSet;
    .registers 7

    .prologue
    .line 144
    iget-object v1, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    .line 145
    .local v1, "keyframes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Keyframe;>;"
    iget-object v5, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 146
    .local v4, "numKeyframes":I
    new-array v2, v4, [Lcom/nineoldandroids/animation/Keyframe;

    .line 147
    .local v2, "newKeyframes":[Lcom/nineoldandroids/animation/Keyframe;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v4, :cond_1c

    .line 148
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->clone()Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v5

    aput-object v5, v2, v0

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 150
    :cond_1c
    new-instance v3, Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-direct {v3, v2}, Lcom/nineoldandroids/animation/KeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe;)V

    .line 151
    .local v3, "newSet":Lcom/nineoldandroids/animation/KeyframeSet;
    return-object v3
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/KeyframeSet;->clone()Lcom/nineoldandroids/animation/KeyframeSet;

    move-result-object v0

    return-object v0
.end method

.method public getValue(F)Ljava/lang/Object;
    .registers 11
    .param p1, "fraction"    # F

    .prologue
    .line 169
    iget v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_22

    .line 170
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v6, :cond_f

    .line 171
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v6, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 173
    :cond_f
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    iget-object v7, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v7

    iget-object v8, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v8}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, p1, v7, v8}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 216
    :goto_21
    return-object v6

    .line 176
    :cond_22
    const/4 v6, 0x0

    cmpg-float v6, p1, v6

    if-gtz v6, :cond_5a

    .line 177
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe;

    .line 178
    .local v3, "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 179
    .local v1, "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_3a

    .line 180
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 182
    :cond_3a
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v6}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v4

    .line 183
    .local v4, "prevFraction":F
    sub-float v6, p1, v4

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v7

    sub-float/2addr v7, v4

    div-float v2, v6, v7

    .line 185
    .local v2, "intervalFraction":F
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    iget-object v7, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v2, v7, v8}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_21

    .line 187
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v3    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    .end local v4    # "prevFraction":F
    :cond_5a
    const/high16 v6, 0x3f800000

    cmpl-float v6, p1, v6

    if-ltz v6, :cond_98

    .line 188
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    iget v7, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    add-int/lit8 v7, v7, -0x2

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/Keyframe;

    .line 189
    .local v5, "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v6}, Lcom/nineoldandroids/animation/Keyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 190
    .restart local v1    # "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_78

    .line 191
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 193
    :cond_78
    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v4

    .line 194
    .restart local v4    # "prevFraction":F
    sub-float v6, p1, v4

    iget-object v7, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v7

    sub-float/2addr v7, v4

    div-float v2, v6, v7

    .line 196
    .restart local v2    # "intervalFraction":F
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v7

    iget-object v8, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v8}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v2, v7, v8}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_21

    .line 199
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v4    # "prevFraction":F
    .end local v5    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    :cond_98
    iget-object v5, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mFirstKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    .line 200
    .restart local v5    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_9b
    iget v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    if-ge v0, v6, :cond_da

    .line 201
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Keyframe;

    .line 202
    .restart local v3    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v6

    cmpg-float v6, p1, v6

    if-gez v6, :cond_d6

    .line 203
    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 204
    .restart local v1    # "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_b9

    .line 205
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 207
    :cond_b9
    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v4

    .line 208
    .restart local v4    # "prevFraction":F
    sub-float v6, p1, v4

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getFraction()F

    move-result v7

    sub-float/2addr v7, v4

    div-float v2, v6, v7

    .line 210
    .restart local v2    # "intervalFraction":F
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v2, v7, v8}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    goto/16 :goto_21

    .line 213
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v4    # "prevFraction":F
    :cond_d6
    move-object v5, v3

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_9b

    .line 216
    .end local v3    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe;
    :cond_da
    iget-object v6, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mLastKeyframe:Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v6}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v6

    goto/16 :goto_21
.end method

.method public setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V
    .registers 2
    .param p1, "evaluator"    # Lcom/nineoldandroids/animation/TypeEvaluator;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 140
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 221
    const-string v1, " "

    .line 222
    .local v1, "returnVal":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget v2, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mNumKeyframes:I

    if-ge v0, v2, :cond_2d

    .line 223
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, p0, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 222
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 225
    :cond_2d
    return-object v1
.end method
