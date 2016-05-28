.class public Lcom/nineoldandroids/animation/PropertyValuesHolder;
.super Ljava/lang/Object;
.source "PropertyValuesHolder.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/animation/PropertyValuesHolder$1;,
        Lcom/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder;,
        Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;
    }
.end annotation


# static fields
.field private static DOUBLE_VARIANTS:[Ljava/lang/Class;

.field private static FLOAT_VARIANTS:[Ljava/lang/Class;

.field private static INTEGER_VARIANTS:[Ljava/lang/Class;

.field private static final sFloatEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field private static final sGetterPropertyMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Class;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sIntEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field private static final sSetterPropertyMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Class;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mAnimatedValue:Ljava/lang/Object;

.field private mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field private mGetter:Ljava/lang/reflect/Method;

.field mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

.field protected mProperty:Lcom/nineoldandroids/util/Property;

.field final mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field mPropertyName:Ljava/lang/String;

.field mSetter:Ljava/lang/reflect/Method;

.field final mTmpValueArray:[Ljava/lang/Object;

.field mValueType:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 80
    new-instance v0, Lcom/nineoldandroids/animation/IntEvaluator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/IntEvaluator;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sIntEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 81
    new-instance v0, Lcom/nineoldandroids/animation/FloatEvaluator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/FloatEvaluator;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sFloatEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 90
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v3

    const-class v1, Ljava/lang/Float;

    aput-object v1, v0, v4

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v5

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v6

    const-class v1, Ljava/lang/Double;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-class v2, Ljava/lang/Integer;

    aput-object v2, v0, v1

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->FLOAT_VARIANTS:[Ljava/lang/Class;

    .line 92
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v3

    const-class v1, Ljava/lang/Integer;

    aput-object v1, v0, v4

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v5

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v6

    const-class v1, Ljava/lang/Float;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-class v2, Ljava/lang/Double;

    aput-object v2, v0, v1

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->INTEGER_VARIANTS:[Ljava/lang/Class;

    .line 94
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v3

    const-class v1, Ljava/lang/Double;

    aput-object v1, v0, v4

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v5

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v0, v6

    const-class v1, Ljava/lang/Float;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-class v2, Ljava/lang/Integer;

    aput-object v2, v0, v1

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->DOUBLE_VARIANTS:[Ljava/lang/Class;

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sSetterPropertyMap:Ljava/util/HashMap;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sGetterPropertyMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Lcom/nineoldandroids/util/Property;)V
    .registers 3
    .param p1, "property"    # Lcom/nineoldandroids/util/Property;

    .prologue
    const/4 v0, 0x0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    .line 65
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mGetter:Ljava/lang/reflect/Method;

    .line 76
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 107
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 110
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    .line 140
    iput-object p1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    .line 141
    if-eqz p1, :cond_20

    .line 142
    invoke-virtual {p1}, Lcom/nineoldandroids/util/Property;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    .line 144
    :cond_20
    return-void
.end method

.method synthetic constructor <init>(Lcom/nineoldandroids/util/Property;Lcom/nineoldandroids/animation/PropertyValuesHolder$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/nineoldandroids/util/Property;
    .param p2, "x1"    # Lcom/nineoldandroids/animation/PropertyValuesHolder$1;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Lcom/nineoldandroids/util/Property;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    .line 65
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mGetter:Ljava/lang/reflect/Method;

    .line 76
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 107
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 110
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    .line 132
    iput-object p1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    .line 133
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/nineoldandroids/animation/PropertyValuesHolder$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/nineoldandroids/animation/PropertyValuesHolder$1;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static getMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 744
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_9

    .line 750
    .end local p0    # "prefix":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object p0

    .line 748
    .restart local p0    # "prefix":Ljava/lang/String;
    :cond_9
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 749
    .local v0, "firstLetter":C
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 750
    .local v1, "theRest":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_8
.end method

.method private getPropertyFunction(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 19
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "valueType"    # Ljava/lang/Class;

    .prologue
    .line 381
    const/4 v8, 0x0

    .line 382
    .local v8, "returnVal":Ljava/lang/reflect/Method;
    iget-object v12, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 383
    .local v7, "methodName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 384
    .local v1, "args":[Ljava/lang/Class;
    if-nez p3, :cond_46

    .line 386
    :try_start_c
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_11
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_11} :catch_14

    move-result-object v8

    :goto_12
    move-object v9, v8

    .line 440
    .end local v8    # "returnVal":Ljava/lang/reflect/Method;
    .local v9, "returnVal":Ljava/lang/reflect/Method;
    :goto_13
    return-object v9

    .line 387
    .end local v9    # "returnVal":Ljava/lang/reflect/Method;
    .restart local v8    # "returnVal":Ljava/lang/reflect/Method;
    :catch_14
    move-exception v3

    .line 392
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    :try_start_15
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 393
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_1f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_15 .. :try_end_1f} :catch_20

    goto :goto_12

    .line 394
    :catch_20
    move-exception v4

    .line 395
    .local v4, "e2":Ljava/lang/NoSuchMethodException;
    const-string v12, "PropertyValuesHolder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Couldn\'t find no-arg method for property "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ": "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 400
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    .end local v4    # "e2":Ljava/lang/NoSuchMethodException;
    :cond_46
    const/4 v12, 0x1

    new-array v1, v12, [Ljava/lang/Class;

    .line 402
    iget-object v12, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    const-class v13, Ljava/lang/Float;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_69

    .line 403
    sget-object v11, Lcom/nineoldandroids/animation/PropertyValuesHolder;->FLOAT_VARIANTS:[Ljava/lang/Class;

    .line 412
    .local v11, "typeVariants":[Ljava/lang/Class;
    :goto_55
    move-object v2, v11

    .local v2, "arr$":[Ljava/lang/Class;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_58
    if-ge v5, v6, :cond_a0

    aget-object v10, v2, v5

    .line 413
    .local v10, "typeVariant":Ljava/lang/Class;
    const/4 v12, 0x0

    aput-object v10, v1, v12

    .line 415
    :try_start_5f
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 417
    iput-object v10, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;
    :try_end_67
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5f .. :try_end_67} :catch_8c

    move-object v9, v8

    .line 418
    .end local v8    # "returnVal":Ljava/lang/reflect/Method;
    .restart local v9    # "returnVal":Ljava/lang/reflect/Method;
    goto :goto_13

    .line 404
    .end local v2    # "arr$":[Ljava/lang/Class;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v9    # "returnVal":Ljava/lang/reflect/Method;
    .end local v10    # "typeVariant":Ljava/lang/Class;
    .end local v11    # "typeVariants":[Ljava/lang/Class;
    .restart local v8    # "returnVal":Ljava/lang/reflect/Method;
    :cond_69
    iget-object v12, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    const-class v13, Ljava/lang/Integer;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_76

    .line 405
    sget-object v11, Lcom/nineoldandroids/animation/PropertyValuesHolder;->INTEGER_VARIANTS:[Ljava/lang/Class;

    .restart local v11    # "typeVariants":[Ljava/lang/Class;
    goto :goto_55

    .line 406
    .end local v11    # "typeVariants":[Ljava/lang/Class;
    :cond_76
    iget-object v12, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    const-class v13, Ljava/lang/Double;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_83

    .line 407
    sget-object v11, Lcom/nineoldandroids/animation/PropertyValuesHolder;->DOUBLE_VARIANTS:[Ljava/lang/Class;

    .restart local v11    # "typeVariants":[Ljava/lang/Class;
    goto :goto_55

    .line 409
    .end local v11    # "typeVariants":[Ljava/lang/Class;
    :cond_83
    const/4 v12, 0x1

    new-array v11, v12, [Ljava/lang/Class;

    .line 410
    .restart local v11    # "typeVariants":[Ljava/lang/Class;
    const/4 v12, 0x0

    iget-object v13, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    aput-object v13, v11, v12

    goto :goto_55

    .line 419
    .restart local v2    # "arr$":[Ljava/lang/Class;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    .restart local v10    # "typeVariant":Ljava/lang/Class;
    :catch_8c
    move-exception v3

    .line 424
    .restart local v3    # "e":Ljava/lang/NoSuchMethodException;
    :try_start_8d
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 425
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 427
    iput-object v10, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;
    :try_end_99
    .catch Ljava/lang/NoSuchMethodException; {:try_start_8d .. :try_end_99} :catch_9c

    move-object v9, v8

    .line 428
    .end local v8    # "returnVal":Ljava/lang/reflect/Method;
    .restart local v9    # "returnVal":Ljava/lang/reflect/Method;
    goto/16 :goto_13

    .line 429
    .end local v9    # "returnVal":Ljava/lang/reflect/Method;
    .restart local v8    # "returnVal":Ljava/lang/reflect/Method;
    :catch_9c
    move-exception v12

    .line 412
    add-int/lit8 v5, v5, 0x1

    goto :goto_58

    .line 435
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    .end local v10    # "typeVariant":Ljava/lang/Class;
    :cond_a0
    const-string v12, "PropertyValuesHolder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Couldn\'t find setter/getter for property "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " with value type "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_12
.end method

.method public static varargs ofFloat(Lcom/nineoldandroids/util/Property;[F)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 3
    .param p1, "values"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nineoldandroids/util/Property",
            "<*",
            "Ljava/lang/Float;",
            ">;[F)",
            "Lcom/nineoldandroids/animation/PropertyValuesHolder;"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "property":Lcom/nineoldandroids/util/Property;, "Lcom/nineoldandroids/util/Property<*Ljava/lang/Float;>;"
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder;-><init>(Lcom/nineoldandroids/util/Property;[F)V

    return-object v0
.end method

.method public static varargs ofFloat(Ljava/lang/String;[F)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 3
    .param p0, "propertyName"    # Ljava/lang/String;
    .param p1, "values"    # [F

    .prologue
    .line 176
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder;-><init>(Ljava/lang/String;[F)V

    return-object v0
.end method

.method public static varargs ofInt(Lcom/nineoldandroids/util/Property;[I)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 3
    .param p1, "values"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nineoldandroids/util/Property",
            "<*",
            "Ljava/lang/Integer;",
            ">;[I)",
            "Lcom/nineoldandroids/animation/PropertyValuesHolder;"
        }
    .end annotation

    .prologue
    .line 165
    .local p0, "property":Lcom/nineoldandroids/util/Property;, "Lcom/nineoldandroids/util/Property<*Ljava/lang/Integer;>;"
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;-><init>(Lcom/nineoldandroids/util/Property;[I)V

    return-object v0
.end method

.method public static varargs ofInt(Ljava/lang/String;[I)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 3
    .param p0, "propertyName"    # Ljava/lang/String;
    .param p1, "values"    # [I

    .prologue
    .line 154
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder;-><init>(Ljava/lang/String;[I)V

    return-object v0
.end method

.method public static varargs ofObject(Lcom/nineoldandroids/util/Property;Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 4
    .param p0, "property"    # Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/nineoldandroids/util/Property;",
            "Lcom/nineoldandroids/animation/TypeEvaluator",
            "<TV;>;[TV;)",
            "Lcom/nineoldandroids/animation/PropertyValuesHolder;"
        }
    .end annotation

    .prologue
    .line 224
    .local p1, "evaluator":Lcom/nineoldandroids/animation/TypeEvaluator;, "Lcom/nineoldandroids/animation/TypeEvaluator<TV;>;"
    .local p2, "values":[Ljava/lang/Object;, "[TV;"
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;

    invoke-direct {v0, p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Lcom/nineoldandroids/util/Property;)V

    .line 225
    .local v0, "pvh":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v0, p2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    .line 226
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 227
    return-object v0
.end method

.method public static varargs ofObject(Ljava/lang/String;Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 4
    .param p0, "propertyName"    # Ljava/lang/String;
    .param p1, "evaluator"    # Lcom/nineoldandroids/animation/TypeEvaluator;
    .param p2, "values"    # [Ljava/lang/Object;

    .prologue
    .line 204
    new-instance v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;

    invoke-direct {v0, p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;-><init>(Ljava/lang/String;)V

    .line 205
    .local v0, "pvh":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v0, p2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    .line 206
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 207
    return-object v0
.end method

.method private setupGetter(Ljava/lang/Class;)V
    .registers 5
    .param p1, "targetClass"    # Ljava/lang/Class;

    .prologue
    .line 493
    sget-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sGetterPropertyMap:Ljava/util/HashMap;

    const-string v1, "get"

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupSetterOrGetter(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mGetter:Ljava/lang/reflect/Method;

    .line 494
    return-void
.end method

.method private setupSetterOrGetter(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 10
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "valueType"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Class;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 457
    .local p2, "propertyMapMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Class;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/reflect/Method;>;>;"
    const/4 v2, 0x0

    .line 462
    .local v2, "setterOrGetter":Ljava/lang/reflect/Method;
    :try_start_1
    iget-object v3, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 463
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 464
    .local v1, "propertyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/reflect/Method;>;"
    if-eqz v1, :cond_1c

    .line 465
    iget-object v3, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/lang/reflect/Method;

    move-object v2, v0

    .line 467
    :cond_1c
    if-nez v2, :cond_31

    .line 468
    invoke-direct {p0, p1, p3, p4}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getPropertyFunction(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 469
    if-nez v1, :cond_2c

    .line 470
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "propertyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/reflect/Method;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 471
    .restart local v1    # "propertyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/reflect/Method;>;"
    invoke-virtual {p2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    :cond_2c
    iget-object v3, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_3b

    .line 476
    :cond_31
    iget-object v3, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 478
    return-object v2

    .line 476
    .end local v1    # "propertyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/reflect/Method;>;"
    :catchall_3b
    move-exception v3

    iget-object v4, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyMapLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v3
.end method


# virtual methods
.method calculateValue(F)V
    .registers 3
    .param p1, "fraction"    # F

    .prologue
    .line 670
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/KeyframeSet;->getValue(F)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mAnimatedValue:Ljava/lang/Object;

    .line 671
    return-void
.end method

.method public clone()Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .registers 4

    .prologue
    .line 594
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/PropertyValuesHolder;

    .line 595
    .local v1, "newPVH":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    iput-object v2, v1, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    .line 596
    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    iput-object v2, v1, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    .line 597
    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/KeyframeSet;->clone()Lcom/nineoldandroids/animation/KeyframeSet;

    move-result-object v2

    iput-object v2, v1, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 598
    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    iput-object v2, v1, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;
    :try_end_1a
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_1a} :catch_1b

    .line 602
    .end local v1    # "newPVH":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    :goto_1a
    return-object v1

    .line 600
    :catch_1b
    move-exception v0

    .line 602
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->clone()Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v0

    return-object v0
.end method

.method getAnimatedValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 722
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mAnimatedValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getPropertyName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 713
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    return-object v0
.end method

.method init()V
    .registers 3

    .prologue
    .line 634
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-nez v0, :cond_e

    .line 637
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    const-class v1, Ljava/lang/Integer;

    if-ne v0, v1, :cond_1a

    sget-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sIntEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    :goto_c
    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 641
    :cond_e
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    if-eqz v0, :cond_19

    .line 644
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/KeyframeSet;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 646
    :cond_19
    return-void

    .line 637
    :cond_1a
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    const-class v1, Ljava/lang/Float;

    if-ne v0, v1, :cond_23

    sget-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sFloatEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    goto :goto_c

    :cond_23
    const/4 v0, 0x0

    goto :goto_c
.end method

.method setAnimatedValue(Ljava/lang/Object;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 614
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v1, :cond_d

    .line 615
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-virtual {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/nineoldandroids/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 617
    :cond_d
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_21

    .line 619
    :try_start_11
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    .line 620
    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mTmpValueArray:[Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_11 .. :try_end_21} :catch_22
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_21} :catch_2d

    .line 627
    :cond_21
    :goto_21
    return-void

    .line 621
    :catch_22
    move-exception v0

    .line 622
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_21

    .line 623
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2d
    move-exception v0

    .line 624
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_21
.end method

.method public setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V
    .registers 3
    .param p1, "evaluator"    # Lcom/nineoldandroids/animation/TypeEvaluator;

    .prologue
    .line 659
    iput-object p1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 660
    iget-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/KeyframeSet;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 661
    return-void
.end method

.method public varargs setFloatValues([F)V
    .registers 3
    .param p1, "values"    # [F

    .prologue
    .line 327
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    .line 328
    invoke-static {p1}, Lcom/nineoldandroids/animation/KeyframeSet;->ofFloat([F)Lcom/nineoldandroids/animation/KeyframeSet;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 329
    return-void
.end method

.method public varargs setIntValues([I)V
    .registers 3
    .param p1, "values"    # [I

    .prologue
    .line 309
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    .line 310
    invoke-static {p1}, Lcom/nineoldandroids/animation/KeyframeSet;->ofInt([I)Lcom/nineoldandroids/animation/KeyframeSet;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 311
    return-void
.end method

.method public varargs setObjectValues([Ljava/lang/Object;)V
    .registers 3
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    .line 360
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    .line 361
    invoke-static {p1}, Lcom/nineoldandroids/animation/KeyframeSet;->ofObject([Ljava/lang/Object;)Lcom/nineoldandroids/animation/KeyframeSet;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    .line 362
    return-void
.end method

.method public setProperty(Lcom/nineoldandroids/util/Property;)V
    .registers 2
    .param p1, "property"    # Lcom/nineoldandroids/util/Property;

    .prologue
    .line 701
    iput-object p1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    .line 702
    return-void
.end method

.method public setPropertyName(Ljava/lang/String;)V
    .registers 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 689
    iput-object p1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    .line 690
    return-void
.end method

.method setupSetter(Ljava/lang/Class;)V
    .registers 5
    .param p1, "targetClass"    # Ljava/lang/Class;

    .prologue
    .line 486
    sget-object v0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->sSetterPropertyMap:Ljava/util/HashMap;

    const-string v1, "set"

    iget-object v2, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mValueType:Ljava/lang/Class;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupSetterOrGetter(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    .line 487
    return-void
.end method

.method setupSetterAndGetter(Ljava/lang/Object;)V
    .registers 10
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 507
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    if-eqz v5, :cond_60

    .line 510
    :try_start_4
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-virtual {v5, p1}, Lcom/nineoldandroids/util/Property;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 511
    .local v4, "testValue":Ljava/lang/Object;
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    iget-object v5, v5, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_af

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/animation/Keyframe;

    .line 512
    .local v2, "kf":Lcom/nineoldandroids/animation/Keyframe;
    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Keyframe;->hasValue()Z

    move-result v5

    if-nez v5, :cond_12

    .line 513
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-virtual {v5, p1}, Lcom/nineoldandroids/util/Property;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/nineoldandroids/animation/Keyframe;->setValue(Ljava/lang/Object;)V
    :try_end_2d
    .catch Ljava/lang/ClassCastException; {:try_start_4 .. :try_end_2d} :catch_2e

    goto :goto_12

    .line 517
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "kf":Lcom/nineoldandroids/animation/Keyframe;
    .end local v4    # "testValue":Ljava/lang/Object;
    :catch_2e
    move-exception v0

    .line 518
    .local v0, "e":Ljava/lang/ClassCastException;
    const-string v5, "PropertyValuesHolder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No such property ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    invoke-virtual {v7}, Lcom/nineoldandroids/util/Property;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") on target object "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Trying reflection instead"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mProperty:Lcom/nineoldandroids/util/Property;

    .line 523
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :cond_60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 524
    .local v3, "targetClass":Ljava/lang/Class;
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mSetter:Ljava/lang/reflect/Method;

    if-nez v5, :cond_6b

    .line 525
    invoke-virtual {p0, v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupSetter(Ljava/lang/Class;)V

    .line 527
    :cond_6b
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    iget-object v5, v5, Lcom/nineoldandroids/animation/KeyframeSet;->mKeyframes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_73
    :goto_73
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_af

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/animation/Keyframe;

    .line 528
    .restart local v2    # "kf":Lcom/nineoldandroids/animation/Keyframe;
    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Keyframe;->hasValue()Z

    move-result v5

    if-nez v5, :cond_73

    .line 529
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mGetter:Ljava/lang/reflect/Method;

    if-nez v5, :cond_8c

    .line 530
    invoke-direct {p0, v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setupGetter(Ljava/lang/Class;)V

    .line 533
    :cond_8c
    :try_start_8c
    iget-object v5, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mGetter:Ljava/lang/reflect/Method;

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/nineoldandroids/animation/Keyframe;->setValue(Ljava/lang/Object;)V
    :try_end_98
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8c .. :try_end_98} :catch_99
    .catch Ljava/lang/IllegalAccessException; {:try_start_8c .. :try_end_98} :catch_a4

    goto :goto_73

    .line 534
    :catch_99
    move-exception v0

    .line 535
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v5, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_73

    .line 536
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_a4
    move-exception v0

    .line 537
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v5, "PropertyValuesHolder"

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_73

    .line 541
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "kf":Lcom/nineoldandroids/animation/Keyframe;
    .end local v3    # "targetClass":Ljava/lang/Class;
    :cond_af
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 727
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mPropertyName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/nineoldandroids/animation/PropertyValuesHolder;->mKeyframeSet:Lcom/nineoldandroids/animation/KeyframeSet;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/KeyframeSet;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
