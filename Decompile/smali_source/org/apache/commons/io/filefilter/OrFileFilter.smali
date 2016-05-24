.class public Lorg/apache/commons/io/filefilter/OrFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "OrFileFilter.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final fileFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/io/filefilter/IOFileFilter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "fileFilters":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/io/filefilter/IOFileFilter;>;"
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 60
    if-nez p1, :cond_d

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    .line 65
    :goto_c
    return-void

    .line 63
    :cond_d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    goto :goto_c
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 117
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 118
    .local v0, "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    invoke-interface {v0, p1}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 119
    const/4 v2, 0x1

    .line 122
    .end local v0    # "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 130
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 131
    .local v0, "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    invoke-interface {v0, p1, p2}, Lorg/apache/commons/io/filefilter/IOFileFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 132
    const/4 v2, 0x1

    .line 135
    .end local v0    # "fileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-super {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    const-string v3, "("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    iget-object v3, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    if-eqz v3, :cond_3a

    .line 149
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    iget-object v3, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3a

    .line 150
    if-lez v2, :cond_25

    .line 151
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    :cond_25
    iget-object v3, p0, Lorg/apache/commons/io/filefilter/OrFileFilter;->fileFilters:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 154
    .local v1, "filter":Ljava/lang/Object;
    if-nez v1, :cond_35

    const-string v3, "null"

    :goto_2f
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 154
    :cond_35
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2f

    .line 157
    .end local v1    # "filter":Ljava/lang/Object;
    .end local v2    # "i":I
    :cond_3a
    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
