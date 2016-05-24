.class Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;
.super Lcom/nineoldandroids/animation/PropertyValuesHolder;
.source "PropertyValuesHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/PropertyValuesHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntPropertyValuesHolder"
.end annotation


# instance fields
.field mIntAnimatedValue:I

.field mIntKeyframeSet:Lcom/nineoldandroids/animation/IntKeyframeSet;

.field private mIntProperty:Lcom/nineoldandroids/util/IntProperty;


# direct methods
.method public varargs constructor <init>(Lcom/nineoldandroids/util/Property;[I)V
    .registers 4
    .param p1, "property"    # Lcom/nineoldandroids/util/Property;
    .param p2, "values"    # [I

    .prologue
    .line 787
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Lcom/nineoldandroids/util/Property;Lcom/nineoldandroids/animation/PropertyValuesHolder$1;)V

    .line 788
    invoke-virtual {p0, p2}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->setIntValues([I)V

    .line 789
    instance-of v0, p1, Lcom/nineoldandroids/util/IntProperty;

    if-eqz v0, :cond_11

    .line 790
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    check-cast v0, Lcom/nineoldandroids/util/IntProperty;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntProperty:Lcom/nineoldandroids/util/IntProperty;

    .line 792
    :cond_11
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[I)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [I

    .prologue
    .line 782
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Ljava/lang/String;Lcom/nineoldandroids/animation/PropertyValuesHolder$1;)V

    .line 783
    invoke-virtual {p0, p2}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->setIntValues([I)V

    .line 784
    return-void
.end method


# virtual methods
.method calculateValue(F)V
    .registers 3
    .param p1, "fraction"    # F

    .prologue
    .line 802
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntKeyframeSet:Lcom/nineoldandroids/animation/IntKeyframeSet;

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/IntKeyframeSet;->getIntValue(F)I

    move-result v0

    iput v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntAnimatedValue:I

    .line 803
    return-void
.end method

.method public clone()Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;
    .registers 3

    .prologue
    .line 812
    invoke-super {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->clone()Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;

    .line 813
    .local v0, "newPVH":Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;
    iget-object v1, v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    check-cast v1, Lcom/nineoldandroids/animation/IntKeyframeSet;

    iput-object v1, v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntKeyframeSet:Lcom/nineoldandroids/animation/IntKeyframeSet;

    .line 814
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 2

    .prologue
    .line 753
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->clone()Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;

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
    .line 753
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->clone()Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;

    move-result-object v0

    return-object v0
.end method

.method getAnimatedValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 807
    iget v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntAnimatedValue:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method setAnimatedValue(Ljava/lang/Object;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 826
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntProperty:Lcom/nineoldandroids/util/IntProperty;

    if-eqz v1, :cond_c

    .line 827
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntProperty:Lcom/nineoldandroids/util/IntProperty;

    iget v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntAnimatedValue:I

    invoke-virtual {v1, p1, v2}, Lcom/nineoldandroids/util/IntProperty;->setValue(Ljava/lang/Object;I)V

    .line 848
    :cond_b
    :goto_b
    return-void

    .line 830
    :cond_c
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v1, :cond_1c

    .line 831
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    iget v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntAnimatedValue:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/nineoldandroids/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_b

    .line 838
    :cond_1c
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_b

    .line 840
    :try_start_20
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntAnimatedValue:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 841
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_20 .. :try_end_32} :catch_33
    .catch Ljava/lang/IllegalAccessException; {:try_start_20 .. :try_end_32} :catch_3e

    goto :goto_b

    .line 842
    :catch_33
    move-exception v0

    .line 843
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    .line 844
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_3e
    move-exception v0

    .line 845
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method public varargs setIntValues([I)V
    .registers 3
    .param p1, "values"    # [I

    .prologue
    .line 796
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setIntValues([I)V

    .line 797
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    check-cast v0, Lcom/nineoldandroids/animation/IntKeyframeSet;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mIntKeyframeSet:Lcom/nineoldandroids/animation/IntKeyframeSet;

    .line 798
    return-void
.end method

.method setupSetter(Ljava/lang/Class;)V
    .registers 3
    .param p1, "targetClass"    # Ljava/lang/Class;

    .prologue
    .line 852
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v0, :cond_5

    .line 886
    :goto_4
    return-void

    .line 884
    :cond_5
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupSetter(Ljava/lang/Class;)V

    goto :goto_4
.end method
