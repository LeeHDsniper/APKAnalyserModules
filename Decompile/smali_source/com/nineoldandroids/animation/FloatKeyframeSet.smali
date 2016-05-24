.class Lcom/nineoldandroids/animation/FloatKeyframeSet;
.super Lcom/nineoldandroids/animation/KeyframeSet;
.source "FloatKeyframeSet.java"


# instance fields
.field private deltaValue:F

.field private firstTime:Z

.field private firstValue:F

.field private lastValue:F


# direct methods
.method public varargs constructor <init>([Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;)V
    .registers 3
    .param p1, "keyframes"    # [Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/nineoldandroids/animation/KeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe;)V

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstTime:Z

    .line 43
    return-void
.end method


# virtual methods
.method public clone()Lcom/nineoldandroids/animation/FloatKeyframeSet;
    .registers 7

    .prologue
    .line 52
    iget-object v1, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    .line 53
    .local v1, "keyframes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Keyframe;>;"
    iget-object v5, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 54
    .local v4, "numKeyframes":I
    new-array v2, v4, [Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 55
    .local v2, "newKeyframes":[Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v4, :cond_1e

    .line 56
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v5}, Lcom/nineoldandroids/animation/Keyframe;->clone()Lcom/nineoldandroids/animation/Keyframe;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    aput-object v5, v2, v0

    .line 55
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 58
    :cond_1e
    new-instance v3, Lcom/nineoldandroids/animation/FloatKeyframeSet;

    invoke-direct {v3, v2}, Lcom/nineoldandroids/animation/FloatKeyframeSet;-><init>([Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;)V

    .line 59
    .local v3, "newSet":Lcom/nineoldandroids/animation/FloatKeyframeSet;
    return-object v3
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/KeyframeSet;
    .registers 2

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/FloatKeyframeSet;->clone()Lcom/nineoldandroids/animation/FloatKeyframeSet;

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
    .line 35
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/FloatKeyframeSet;->clone()Lcom/nineoldandroids/animation/FloatKeyframeSet;

    move-result-object v0

    return-object v0
.end method

.method public getFloatValue(F)F
    .registers 15
    .param p1, "fraction"    # F

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 63
    iget v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mNumKeyframes:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_5e

    .line 64
    iget-boolean v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstTime:Z

    if-eqz v9, :cond_30

    .line 65
    iput-boolean v11, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstTime:Z

    .line 66
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    invoke-virtual {v9}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v9

    iput v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstValue:F

    .line 67
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    invoke-virtual {v9}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v9

    iput v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->lastValue:F

    .line 68
    iget v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->lastValue:F

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstValue:F

    sub-float/2addr v9, v10

    iput v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->deltaValue:F

    .line 70
    :cond_30
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v9, :cond_3a

    .line 71
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v9, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 73
    :cond_3a
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-nez v9, :cond_45

    .line 74
    iget v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstValue:F

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->deltaValue:F

    mul-float/2addr v10, p1

    add-float/2addr v9, v10

    .line 132
    :goto_44
    return v9

    .line 76
    :cond_45
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->firstValue:F

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    iget v11, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->lastValue:F

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v9, p1, v10, v11}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    goto :goto_44

    .line 79
    :cond_5e
    const/4 v9, 0x0

    cmpg-float v9, p1, v9

    if-gtz v9, :cond_b1

    .line 80
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 81
    .local v7, "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 82
    .local v4, "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v8

    .line 83
    .local v8, "prevValue":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v5

    .line 84
    .local v5, "nextValue":F
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v6

    .line 85
    .local v6, "prevFraction":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v3

    .line 86
    .local v3, "nextFraction":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 87
    .local v1, "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_8d

    .line 88
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 90
    :cond_8d
    sub-float v9, p1, v6

    sub-float v10, v3, v6

    div-float v2, v9, v10

    .line 91
    .local v2, "intervalFraction":F
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-nez v9, :cond_9c

    sub-float v9, v5, v8

    mul-float/2addr v9, v2

    add-float/2addr v9, v8

    goto :goto_44

    :cond_9c
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v9, v2, v10, v11}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    goto :goto_44

    .line 95
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v3    # "nextFraction":F
    .end local v4    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    .end local v5    # "nextValue":F
    .end local v6    # "prevFraction":F
    .end local v7    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    .end local v8    # "prevValue":F
    :cond_b1
    const/high16 v9, 0x3f800000

    cmpl-float v9, p1, v9

    if-ltz v9, :cond_10f

    .line 96
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mNumKeyframes:I

    add-int/lit8 v10, v10, -0x2

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 97
    .restart local v7    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mNumKeyframes:I

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 98
    .restart local v4    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v8

    .line 99
    .restart local v8    # "prevValue":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v5

    .line 100
    .restart local v5    # "nextValue":F
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v6

    .line 101
    .restart local v6    # "prevFraction":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v3

    .line 102
    .restart local v3    # "nextFraction":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 103
    .restart local v1    # "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_e9

    .line 104
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 106
    :cond_e9
    sub-float v9, p1, v6

    sub-float v10, v3, v6

    div-float v2, v9, v10

    .line 107
    .restart local v2    # "intervalFraction":F
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-nez v9, :cond_f9

    sub-float v9, v5, v8

    mul-float/2addr v9, v2

    add-float/2addr v9, v8

    goto/16 :goto_44

    :cond_f9
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v9, v2, v10, v11}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    goto/16 :goto_44

    .line 112
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v3    # "nextFraction":F
    .end local v4    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    .end local v5    # "nextValue":F
    .end local v6    # "prevFraction":F
    .end local v7    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    .end local v8    # "prevValue":F
    :cond_10f
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 113
    .restart local v7    # "prevKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_118
    iget v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mNumKeyframes:I

    if-ge v0, v9, :cond_173

    .line 114
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;

    .line 115
    .restart local v4    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v9

    cmpg-float v9, p1, v9

    if-gez v9, :cond_16f

    .line 116
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v1

    .line 117
    .restart local v1    # "interpolator":Landroid/view/animation/Interpolator;
    if-eqz v1, :cond_136

    .line 118
    invoke-interface {v1, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 120
    :cond_136
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v9

    sub-float v9, p1, v9

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v10

    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFraction()F

    move-result v11

    sub-float/2addr v10, v11

    div-float v2, v9, v10

    .line 122
    .restart local v2    # "intervalFraction":F
    invoke-virtual {v7}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v8

    .line 123
    .restart local v8    # "prevValue":F
    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;->getFloatValue()F

    move-result v5

    .line 124
    .restart local v5    # "nextValue":F
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-nez v9, :cond_159

    sub-float v9, v5, v8

    mul-float/2addr v9, v2

    add-float/2addr v9, v8

    goto/16 :goto_44

    :cond_159
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v9, v2, v10, v11}, Lcom/nineoldandroids/animation/TypeEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    goto/16 :goto_44

    .line 129
    .end local v1    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v2    # "intervalFraction":F
    .end local v5    # "nextValue":F
    .end local v8    # "prevValue":F
    :cond_16f
    move-object v7, v4

    .line 113
    add-int/lit8 v0, v0, 0x1

    goto :goto_118

    .line 132
    .end local v4    # "nextKeyframe":Lcom/nineoldandroids/animation/Keyframe$FloatKeyframe;
    :cond_173
    iget-object v9, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    iget v10, p0, Lcom/nineoldandroids/animation/FloatKeyframeSet;->mNumKeyframes:I

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/Keyframe;

    invoke-virtual {v9}, Lcom/nineoldandroids/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    goto/16 :goto_44
.end method

.method public getValue(F)Ljava/lang/Object;
    .registers 3
    .param p1, "fraction"    # F

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/nineoldandroids/animation/FloatKeyframeSet;->getFloatValue(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method
