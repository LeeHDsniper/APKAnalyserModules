.class public Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
.super Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;
.source "SingleClientConnManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/conn/SingleClientConnManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ConnAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/SingleClientConnManager;


# direct methods
.method protected constructor <init>(Lorg/apache/http/impl/conn/SingleClientConnManager;Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 4
    .param p2, "entry"    # Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 419
    iput-object p1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->this$0:Lorg/apache/http/impl/conn/SingleClientConnManager;

    .line 420
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 421
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->markReusable()V

    .line 422
    iput-object p3, p2, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->route:Lorg/apache/http/conn/routing/HttpRoute;

    .line 423
    return-void
.end method
