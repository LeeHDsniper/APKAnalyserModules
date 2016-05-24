.class final Lcom/localytics/android/AmpCondition;
.super Ljava/lang/Object;
.source "AmpCondition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/AmpCondition$1;,
        Lcom/localytics/android/AmpCondition$Opt;
    }
.end annotation


# instance fields
.field private mName:Ljava/lang/String;

.field private mOpt:Lcom/localytics/android/AmpCondition$Opt;

.field private mPkgName:Ljava/lang/String;

.field private mValues:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "operator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p3, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/localytics/android/AmpCondition;->mName:Ljava/lang/String;

    .line 50
    invoke-direct {p0, p2}, Lcom/localytics/android/AmpCondition;->stringToOperator(Ljava/lang/String;)Lcom/localytics/android/AmpCondition$Opt;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/AmpCondition;->mOpt:Lcom/localytics/android/AmpCondition$Opt;

    .line 51
    iput-object p3, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    .line 52
    return-void
.end method

.method private isSatisfiedByNumber(Ljava/lang/String;)Z
    .registers 12
    .param p1, "attributeValue"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 150
    const/4 v5, 0x0

    .line 153
    .local v5, "satisfied":Z
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 154
    .local v0, "attribute":Ljava/math/BigDecimal;
    new-instance v9, Ljava/math/BigDecimal;

    iget-object v6, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v6, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v9, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v3

    .line 155
    .local v3, "result1":I
    iget-object v6, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-le v6, v8, :cond_40

    new-instance v9, Ljava/math/BigDecimal;

    iget-object v6, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v6, v8}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v9, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    .line 157
    .local v4, "result2":I
    :goto_32
    sget-object v6, Lcom/localytics/android/AmpCondition$1;->$SwitchMap$com$localytics$android$AmpCondition$Opt:[I

    iget-object v9, p0, Lcom/localytics/android/AmpCondition;->mOpt:Lcom/localytics/android/AmpCondition$Opt;

    invoke-virtual {v9}, Lcom/localytics/android/AmpCondition$Opt;->ordinal()I

    move-result v9

    aget v6, v6, v9

    packed-switch v6, :pswitch_data_8e

    .line 194
    :cond_3f
    :goto_3f
    return v5

    .end local v4    # "result2":I
    :cond_40
    move v4, v7

    .line 155
    goto :goto_32

    .line 160
    .restart local v4    # "result2":I
    :pswitch_42
    if-nez v3, :cond_46

    move v5, v8

    .line 161
    :goto_45
    goto :goto_3f

    :cond_46
    move v5, v7

    .line 160
    goto :goto_45

    .line 163
    :pswitch_48
    if-eqz v3, :cond_4c

    move v5, v8

    .line 164
    :goto_4b
    goto :goto_3f

    :cond_4c
    move v5, v7

    .line 163
    goto :goto_4b

    .line 166
    :pswitch_4e
    if-lez v3, :cond_52

    move v5, v8

    .line 167
    :goto_51
    goto :goto_3f

    :cond_52
    move v5, v7

    .line 166
    goto :goto_51

    .line 169
    :pswitch_54
    if-ltz v3, :cond_58

    move v5, v8

    .line 170
    :goto_57
    goto :goto_3f

    :cond_58
    move v5, v7

    .line 169
    goto :goto_57

    .line 172
    :pswitch_5a
    if-gez v3, :cond_5e

    move v5, v8

    .line 173
    :goto_5d
    goto :goto_3f

    :cond_5e
    move v5, v7

    .line 172
    goto :goto_5d

    .line 175
    :pswitch_60
    if-gtz v3, :cond_64

    move v5, v8

    .line 176
    :goto_63
    goto :goto_3f

    :cond_64
    move v5, v7

    .line 175
    goto :goto_63

    .line 178
    :pswitch_66
    if-ltz v3, :cond_6c

    if-gtz v4, :cond_6c

    move v5, v8

    .line 179
    :goto_6b
    goto :goto_3f

    :cond_6c
    move v5, v7

    .line 178
    goto :goto_6b

    .line 181
    :pswitch_6e
    iget-object v6, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_74
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 183
    .local v1, "conditionValue":Ljava/lang/String;
    new-instance v6, Ljava/math/BigDecimal;

    invoke-direct {v6, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v6

    if-nez v6, :cond_74

    .line 185
    const/4 v5, 0x1

    .line 186
    goto :goto_3f

    .line 157
    nop

    :pswitch_data_8e
    .packed-switch 0x1
        :pswitch_42
        :pswitch_48
        :pswitch_6e
        :pswitch_4e
        :pswitch_54
        :pswitch_5a
        :pswitch_60
        :pswitch_66
    .end packed-switch
.end method

.method private isSatisfiedByString(Ljava/lang/String;)Z
    .registers 8
    .param p1, "attributeValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 113
    const/4 v2, 0x0

    .line 115
    .local v2, "satisfied":Z
    sget-object v4, Lcom/localytics/android/AmpCondition$1;->$SwitchMap$com$localytics$android$AmpCondition$Opt:[I

    iget-object v5, p0, Lcom/localytics/android/AmpCondition;->mOpt:Lcom/localytics/android/AmpCondition$Opt;

    invoke-virtual {v5}, Lcom/localytics/android/AmpCondition$Opt;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_4a

    .line 142
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpCondition;->isSatisfiedByNumber(Ljava/lang/String;)Z

    move-result v2

    .line 145
    :cond_13
    :goto_13
    return v2

    .line 118
    :pswitch_14
    iget-object v4, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 119
    goto :goto_13

    .line 121
    :pswitch_1f
    iget-object v4, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2d

    const/4 v2, 0x1

    .line 122
    :goto_2c
    goto :goto_13

    :cond_2d
    move v2, v3

    .line 121
    goto :goto_2c

    .line 124
    :pswitch_2f
    iget-object v3, p0, Lcom/localytics/android/AmpCondition;->mValues:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 126
    .local v0, "conditionValue":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 128
    const/4 v2, 0x1

    .line 129
    goto :goto_13

    .line 115
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_14
        :pswitch_1f
        :pswitch_2f
    .end packed-switch
.end method

.method private stringToOperator(Ljava/lang/String;)Lcom/localytics/android/AmpCondition$Opt;
    .registers 3
    .param p1, "operator"    # Ljava/lang/String;

    .prologue
    .line 199
    const-string v0, "eq"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 201
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->EQUAL:Lcom/localytics/android/AmpCondition$Opt;

    .line 239
    :goto_a
    return-object v0

    .line 204
    :cond_b
    const-string v0, "neq"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 206
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->NOT_EQUAL:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 209
    :cond_16
    const-string v0, "gt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 211
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->GREATER_THAN:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 214
    :cond_21
    const-string v0, "gte"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 216
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->GREATER_THEN_OR_EQUAL:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 219
    :cond_2c
    const-string v0, "lt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 221
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->LESS_THAN:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 224
    :cond_37
    const-string v0, "lte"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 226
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->LESS_THAN_OR_EQUAL:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 229
    :cond_42
    const-string v0, "btw"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 231
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->BETWEEN:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 234
    :cond_4d
    const-string v0, "in"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 236
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->IN_LIST:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a

    .line 239
    :cond_58
    sget-object v0, Lcom/localytics/android/AmpCondition$Opt;->INVALID:Lcom/localytics/android/AmpCondition$Opt;

    goto :goto_a
.end method


# virtual methods
.method public isSatisfiedByAttributes(Ljava/util/Map;)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 67
    if-nez p1, :cond_6

    move v1, v2

    .line 108
    :cond_5
    :goto_5
    return v1

    .line 73
    :cond_6
    iget-object v3, p0, Lcom/localytics/android/AmpCondition;->mName:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 74
    .local v0, "attributeValue":Ljava/lang/Object;
    if-nez v0, :cond_2d

    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/localytics/android/AmpCondition;->mPkgName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/localytics/android/AmpCondition;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    :cond_2d
    if-nez v0, :cond_46

    .line 82
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_44

    .line 84
    const-string v3, "Localytics"

    const-string v4, "Could not find the AMP condition %s in the attributes dictionary."

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/localytics/android/AmpCondition;->mName:Ljava/lang/String;

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_44
    move v1, v2

    .line 86
    goto :goto_5

    .line 91
    :cond_46
    const/4 v1, 0x0

    .line 92
    .local v1, "satisfied":Z
    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_52

    .line 94
    check-cast v0, Ljava/lang/String;

    .end local v0    # "attributeValue":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/localytics/android/AmpCondition;->isSatisfiedByString(Ljava/lang/String;)Z

    move-result v1

    goto :goto_5

    .line 96
    .restart local v0    # "attributeValue":Ljava/lang/Object;
    :cond_52
    instance-of v3, v0, Ljava/lang/Number;

    if-eqz v3, :cond_5d

    .line 98
    check-cast v0, Ljava/lang/String;

    .end local v0    # "attributeValue":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/localytics/android/AmpCondition;->isSatisfiedByNumber(Ljava/lang/String;)Z

    move-result v1

    goto :goto_5

    .line 102
    .restart local v0    # "attributeValue":Ljava/lang/Object;
    :cond_5d
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_5

    .line 104
    const-string v3, "Localytics"

    const-string v4, "Invalid value type %s in the attributes dictionary."

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method public setPackageName(Ljava/lang/String;)V
    .registers 2
    .param p1, "pkgName"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/localytics/android/AmpCondition;->mPkgName:Ljava/lang/String;

    .line 57
    return-void
.end method
