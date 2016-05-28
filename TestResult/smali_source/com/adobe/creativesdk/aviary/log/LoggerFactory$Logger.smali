.class public interface abstract Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
.super Ljava/lang/Object;
.source "LoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/log/LoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Logger"
.end annotation


# virtual methods
.method public abstract error(Ljava/lang/String;)V
.end method

.method public varargs abstract error(Ljava/lang/String;[Ljava/lang/Object;)V
.end method

.method public abstract info(Ljava/lang/String;)V
.end method

.method public varargs abstract info(Ljava/lang/String;[Ljava/lang/Object;)V
.end method

.method public abstract log(Ljava/lang/String;)V
.end method

.method public varargs abstract log(Ljava/lang/String;[Ljava/lang/Object;)V
.end method

.method public varargs abstract verbose(Ljava/lang/String;[Ljava/lang/Object;)V
.end method

.method public abstract warn(Ljava/lang/String;)V
.end method

.method public varargs abstract warn(Ljava/lang/String;[Ljava/lang/Object;)V
.end method
