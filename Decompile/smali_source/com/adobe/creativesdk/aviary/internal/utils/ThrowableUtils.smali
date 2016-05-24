.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ThrowableUtils;
.super Ljava/lang/Object;
.source "ThrowableUtils.java"


# direct methods
.method public static getLocalizedMessage(Ljava/util/Collection;Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 5
    .param p1, "lineSeparator"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "throwables":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Throwable;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 41
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Throwable;>;"
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 47
    :cond_26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
