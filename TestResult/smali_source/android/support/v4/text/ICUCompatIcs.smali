.class Landroid/support/v4/text/ICUCompatIcs;
.super Ljava/lang/Object;
.source "ICUCompatIcs.java"


# static fields
.field private static sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

.field private static sGetScriptMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 33
    :try_start_0
    const-string v2, "libcore.icu.ICU"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 34
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_28

    .line 35
    const-string v2, "getScript"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    .line 37
    const-string v2, "addLikelySubtags"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    .line 44
    :cond_28
    :goto_28
    return-void

    .line 40
    :catch_29
    move-exception v1

    .line 42
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_28
.end method

.method public static addLikelySubtags(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "locale"    # Ljava/lang/String;

    .prologue
    .line 65
    :try_start_0
    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1a

    .line 66
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    .line 67
    .local v0, "args":[Ljava/lang/Object;
    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_13
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_13} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_13} :catch_1c

    .line 77
    .end local v0    # "args":[Ljava/lang/Object;
    :goto_13
    return-object v2

    .line 69
    :catch_14
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_1a
    :goto_1a
    move-object v2, p0

    .line 77
    goto :goto_13

    .line 73
    :catch_1c
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1a
.end method

.method public static getScript(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "locale"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 48
    :try_start_1
    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1b

    .line 49
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    .line 50
    .local v0, "args":[Ljava/lang/Object;
    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_14
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_14} :catch_15
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_14} :catch_1d

    .line 60
    .end local v0    # "args":[Ljava/lang/Object;
    :goto_14
    return-object v2

    .line 52
    :catch_15
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_1b
    :goto_1b
    move-object v2, v3

    .line 60
    goto :goto_14

    .line 56
    :catch_1d
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1b
.end method
