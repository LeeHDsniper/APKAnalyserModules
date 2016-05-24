.class public final Lcom/localytics/android/ReflectionUtils;
.super Ljava/lang/Object;
.source "ReflectionUtils.java"


# direct methods
.method private static helper(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p0, "target"    # Ljava/lang/Object;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "classObject":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p4, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-eqz p1, :cond_c

    .line 129
    move-object v0, p1

    .line 140
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_3
    :try_start_3
    invoke-virtual {v0, p3, p4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, p0, p5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 131
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_c
    if-eqz p0, :cond_13

    .line 133
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_3

    .line 137
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_16} :catch_18
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_16} :catch_1f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_16} :catch_26
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_16} :catch_2d

    move-result-object v0

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_3

    .line 142
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_18
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 146
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1f
    move-exception v1

    .line 148
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 150
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_26
    move-exception v1

    .line 152
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 154
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2d
    move-exception v1

    .line 156
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static tryInvokeConstructor(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_b} :catch_1b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_b} :catch_22
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_b} :catch_29

    move-result-object v1

    return-object v1

    .line 99
    :catch_d
    move-exception v0

    .line 101
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 103
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_14
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 107
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 111
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_22
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 115
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_29
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static tryInvokeInstance(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p2, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 79
    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/localytics/android/ReflectionUtils;->helper(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static tryInvokeStatic(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p2, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 62
    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/localytics/android/ReflectionUtils;->helper(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
