.class public final Lcom/nineoldandroids/animation/ObjectAnimator;
.super Lcom/nineoldandroids/animation/ValueAnimator;
.source "ObjectAnimator.java"


# static fields
.field private static final PROXY_PROPERTIES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/nineoldandroids/util/Property;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mProperty:Lcom/nineoldandroids/util/Property;

.field private mPropertyName:Ljava/lang/String;

.field private mTarget:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    .line 44
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "alpha"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ALPHA:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "pivotX"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->PIVOT_X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "pivotY"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->PIVOT_Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "translationX"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->TRANSLATION_X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "translationY"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->TRANSLATION_Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "rotation"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "rotationX"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION_X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "rotationY"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION_Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "scaleX"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCALE_X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "scaleY"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCALE_Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "scrollX"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCROLL_X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "scrollY"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCROLL_Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "x"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->X:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    const-string v1, "y"

    sget-object v2, Lcom/nineoldandroids/animation/PreHoneycombCompat;->Y:Lcom/nineoldandroids/util/Property;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 151
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 163
    iput-object p1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mTarget:Ljava/lang/Object;

    .line 164
    invoke-virtual {p0, p2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public static varargs ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 4
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [F

    .prologue
    .line 231
    new-instance v0, Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/ObjectAnimator;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 232
    .local v0, "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    invoke-virtual {v0, p2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setFloatValues([F)V

    .line 233
    return-object v0
.end method

.method public static varargs ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 4
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [I

    .prologue
    .line 193
    new-instance v0, Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/ObjectAnimator;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 194
    .local v0, "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    invoke-virtual {v0, p2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setIntValues([I)V

    .line 195
    return-object v0
.end method


# virtual methods
.method animateValue(F)V
    .registers 6
    .param p1, "fraction"    # F

    .prologue
    .line 491
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/ValueAnimator;->animateValue(F)V

    .line 492
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v2

    .line 493
    .local v1, "numValues":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_15

    .line 494
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mTarget:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setAnimatedValue(Ljava/lang/Object;)V

    .line 493
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 496
    :cond_15
    return-void
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/Animator;
    .registers 2

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ObjectAnimator;->clone()Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 2

    .prologue
    .line 500
    invoke-super {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->clone()Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 501
    .local v0, "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 2

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ObjectAnimator;->clone()Lcom/nineoldandroids/animation/ObjectAnimator;

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
    .line 39
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ObjectAnimator;->clone()Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method initAnimation()V
    .registers 5

    .prologue
    .line 402
    iget-boolean v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mInitialized:Z

    if-nez v2, :cond_3e

    .line 405
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    if-nez v2, :cond_29

    sget-boolean v2, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v2, :cond_29

    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mTarget:Ljava/lang/Object;

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_29

    sget-object v2, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 406
    sget-object v2, Lcom/nineoldandroids/animation/ObjectAnimator;->PROXY_PROPERTIES:Ljava/util/Map;

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/util/Property;

    invoke-virtual {p0, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setProperty(Lcom/nineoldandroids/util/Property;)V

    .line 408
    :cond_29
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v2

    .line 409
    .local v1, "numValues":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2d
    if-ge v0, v1, :cond_3b

    .line 410
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mTarget:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupSetterAndGetter(Ljava/lang/Object;)V

    .line 409
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 412
    :cond_3b
    invoke-super {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->initAnimation()V

    .line 414
    .end local v0    # "i":I
    .end local v1    # "numValues":I
    :cond_3e
    return-void
.end method

.method public bridge synthetic setDuration(J)Lcom/nineoldandroids/animation/Animator;
    .registers 4
    .param p1, "x0"    # J

    .prologue
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method public setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 4
    .param p1, "duration"    # J

    .prologue
    .line 427
    invoke-super {p0, p1, p2}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 428
    return-object p0
.end method

.method public bridge synthetic setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 4
    .param p1, "x0"    # J

    .prologue
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method public varargs setFloatValues([F)V
    .registers 5
    .param p1, "values"    # [F

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 345
    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v0, v0

    if-nez v0, :cond_2b

    .line 348
    :cond_b
    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v0, :cond_1d

    .line 349
    new-array v0, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-static {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofFloat(Lcom/nineoldandroids/util/Property;[F)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 356
    :goto_1c
    return-void

    .line 351
    :cond_1d
    new-array v0, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    goto :goto_1c

    .line 354
    :cond_2b
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/ValueAnimator;->setFloatValues([F)V

    goto :goto_1c
.end method

.method public varargs setIntValues([I)V
    .registers 5
    .param p1, "values"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 330
    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v0, v0

    if-nez v0, :cond_2b

    .line 333
    :cond_b
    iget-object v0, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v0, :cond_1d

    .line 334
    new-array v0, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-static {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofInt(Lcom/nineoldandroids/util/Property;[I)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 341
    :goto_1c
    return-void

    .line 336
    :cond_1d
    new-array v0, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    goto :goto_1c

    .line 339
    :cond_2b
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/ValueAnimator;->setIntValues([I)V

    goto :goto_1c
.end method

.method public varargs setObjectValues([Ljava/lang/Object;)V
    .registers 6
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 360
    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v1

    if-nez v1, :cond_30

    .line 363
    :cond_c
    iget-object v1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v1, :cond_20

    .line 364
    new-array v1, v2, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    check-cast v0, Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v2, v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofObject(Lcom/nineoldandroids/util/Property;Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, v1, v3

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 371
    :goto_1f
    return-void

    .line 366
    :cond_20
    new-array v1, v2, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    check-cast v0, Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v2, v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, v1, v3

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    goto :goto_1f

    .line 369
    :cond_30
    invoke-super {p0, p1}, Lcom/nineoldandroids/animation/ValueAnimator;->setObjectValues([Ljava/lang/Object;)V

    goto :goto_1f
.end method

.method public setProperty(Lcom/nineoldandroids/util/Property;)V
    .registers 7
    .param p1, "property"    # Lcom/nineoldandroids/util/Property;

    .prologue
    const/4 v4, 0x0

    .line 118
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v2, :cond_1c

    .line 119
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v1, v2, v4

    .line 120
    .local v1, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "oldName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setProperty(Lcom/nineoldandroids/util/Property;)V

    .line 122
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValuesMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValuesMap:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .end local v0    # "oldName":Ljava/lang/String;
    .end local v1    # "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    :cond_1c
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v2, :cond_26

    .line 126
    invoke-virtual {p1}, Lcom/nineoldandroids/util/Property;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    .line 128
    :cond_26
    iput-object p1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mProperty:Lcom/nineoldandroids/util/Property;

    .line 130
    iput-boolean v4, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mInitialized:Z

    .line 131
    return-void
.end method

.method public setPropertyName(Ljava/lang/String;)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 96
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v2, :cond_1a

    .line 97
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v1, v2, v3

    .line 98
    .local v1, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "oldName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setPropertyName(Ljava/lang/String;)V

    .line 100
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValuesMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValuesMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .end local v0    # "oldName":Ljava/lang/String;
    .end local v1    # "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    :cond_1a
    iput-object p1, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mPropertyName:Ljava/lang/String;

    .line 105
    iput-boolean v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mInitialized:Z

    .line 106
    return-void
.end method

.method public start()V
    .registers 1

    .prologue
    .line 385
    invoke-super {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 386
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 506
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ObjectAnimator@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", target "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mTarget:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 508
    .local v1, "returnVal":Ljava/lang/String;
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v2, :cond_53

    .line 509
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    iget-object v2, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v2, v2

    if-ge v0, v2, :cond_53

    .line 510
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/nineoldandroids/animation/ObjectAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 509
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 513
    .end local v0    # "i":I
    :cond_53
    return-object v1
.end method
