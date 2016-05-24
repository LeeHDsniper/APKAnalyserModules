.class public final Lrx/internal/util/unsafe/UnsafeAccess;
.super Ljava/lang/Object;
.source "UnsafeAccess.java"


# static fields
.field public static final UNSAFE:Lsun/misc/Unsafe;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 33
    const/4 v2, 0x0

    .line 41
    .local v2, "u":Lsun/misc/Unsafe;
    :try_start_1
    const-class v3, Lsun/misc/Unsafe;

    const-string v4, "theUnsafe"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 42
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 43
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lsun/misc/Unsafe;

    move-object v2, v0
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_16} :catch_19

    .line 47
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :goto_16
    sput-object v2, Lrx/internal/util/unsafe/UnsafeAccess;->UNSAFE:Lsun/misc/Unsafe;

    .line 48
    return-void

    .line 44
    :catch_19
    move-exception v3

    goto :goto_16
.end method

.method public static final isUnsafeAvailable()Z
    .registers 1

    .prologue
    .line 51
    sget-object v0, Lrx/internal/util/unsafe/UnsafeAccess;->UNSAFE:Lsun/misc/Unsafe;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
