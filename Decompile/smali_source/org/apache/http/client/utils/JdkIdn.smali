.class public Lorg/apache/http/client/utils/JdkIdn;
.super Ljava/lang/Object;
.source "JdkIdn.java"

# interfaces
.implements Lorg/apache/http/client/utils/Idn;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final toUnicode:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v2, "java.net.IDN"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 50
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_9
    const-string v2, "toUnicode"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/client/utils/JdkIdn;->toUnicode:Ljava/lang/reflect/Method;
    :try_end_19
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_19} :catch_1a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_9 .. :try_end_19} :catch_25

    .line 58
    return-void

    .line 51
    :catch_1a
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/SecurityException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 54
    .end local v1    # "e":Ljava/lang/SecurityException;
    :catch_25
    move-exception v1

    .line 56
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public toUnicode(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "punycode"    # Ljava/lang/String;

    .prologue
    .line 62
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/client/utils/JdkIdn;->toUnicode:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_f
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_f} :catch_10
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_f} :catch_1b

    return-object v2

    .line 63
    :catch_10
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 65
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1b
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 67
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
