package com.abc.wordbook



import org.junit.*
import grails.test.mixin.*

@TestFor(WordCategoryController)
@Mock(WordCategory)
class WordCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/wordCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wordCategoryInstanceList.size() == 0
        assert model.wordCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.wordCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wordCategoryInstance != null
        assert view == '/wordCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/wordCategory/show/1'
        assert controller.flash.message != null
        assert WordCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/wordCategory/list'

        populateValidParams(params)
        def wordCategory = new WordCategory(params)

        assert wordCategory.save() != null

        params.id = wordCategory.id

        def model = controller.show()

        assert model.wordCategoryInstance == wordCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/wordCategory/list'

        populateValidParams(params)
        def wordCategory = new WordCategory(params)

        assert wordCategory.save() != null

        params.id = wordCategory.id

        def model = controller.edit()

        assert model.wordCategoryInstance == wordCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/wordCategory/list'

        response.reset()

        populateValidParams(params)
        def wordCategory = new WordCategory(params)

        assert wordCategory.save() != null

        // test invalid parameters in update
        params.id = wordCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/wordCategory/edit"
        assert model.wordCategoryInstance != null

        wordCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/wordCategory/show/$wordCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        wordCategory.clearErrors()

        populateValidParams(params)
        params.id = wordCategory.id
        params.version = -1
        controller.update()

        assert view == "/wordCategory/edit"
        assert model.wordCategoryInstance != null
        assert model.wordCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/wordCategory/list'

        response.reset()

        populateValidParams(params)
        def wordCategory = new WordCategory(params)

        assert wordCategory.save() != null
        assert WordCategory.count() == 1

        params.id = wordCategory.id

        controller.delete()

        assert WordCategory.count() == 0
        assert WordCategory.get(wordCategory.id) == null
        assert response.redirectedUrl == '/wordCategory/list'
    }
}
