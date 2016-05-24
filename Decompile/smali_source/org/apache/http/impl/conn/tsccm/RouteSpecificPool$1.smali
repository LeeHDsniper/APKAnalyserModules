.class Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool$1;
.super Ljava/lang/Object;
.source "RouteSpecificPool.java"

# interfaces
.implements Lorg/apache/http/conn/params/ConnPerRoute;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;-><init>(Lorg/apache/http/conn/routing/HttpRoute;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;)V
    .registers 2

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool$1;->this$0:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool$1;->this$0:Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;

    iget v0, v0, Lorg/apache/http/impl/conn/tsccm/RouteSpecificPool;->maxEntries:I

    return v0
.end method
